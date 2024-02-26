{ pkgs, ... }:

{
  # Enable X server and GNOME desktop manager.
  services.xserver = {
    enable = true;

    desktopManager = {
      gnome.enable = true;
    };

    displayManager = {
      gdm.enable = true;
    };

    # Configure keymap in X11 (services.xserver.xkb.layout)
    layout = "gb";
  };

  # Enables Dynamic triple buffering
  # which improves the performance of the window manager.
  nixpkgs.overlays = [
    (final: prev: {
      gnome = prev.gnome.overrideScope' (gnomeFinal: gnomePrev: {
        mutter = gnomePrev.mutter.overrideAttrs ( old: {
          src = pkgs.fetchgit {
            url = "https://gitlab.gnome.org/vanvugt/mutter.git";
            # GNOME 45: triple-buffering-v4-45
            rev = "0b896518b2028d9c4d6ea44806d093fd33793689";
            sha256 = "sha256-mzNy5GPlB2qkI2KEAErJQzO//uo8yO0kPQUwvGDwR4w=";
          };
        } );
      });
    })
  ];

  # System packages and GNOME extensions to be included with GNOME.
  environment.systemPackages = (with pkgs; [
    gnome.gnome-tweaks
    adw-gtk3
  ]) ++ (with pkgs.gnomeExtensions; [
    dash-to-dock
    app-hider
    appindicator
    #rounded-window-corners
    blur-my-shell
    legacy-gtk3-theme-scheme-auto-switcher
    night-theme-switcher
  ]);

  # System packages to be exlucded from GNOME.
  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    cheese # webcam tool
    epiphany # web browser
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ]);
}