{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
    layout = "gb";
  };

  nixpkgs.overlays = [
    (final: prev: {
      gnome = prev.gnome.overrideScope' (gnomeFinal: gnomePrev: {
        mutter = gnomePrev.mutter.overrideAttrs ( old: {
          src = pkgs.fetchgit {
            url = "https://gitlab.gnome.org/vanvugt/mutter.git";
            rev = "0b896518b2028d9c4d6ea44806d093fd33793689";
            sha256 = "sha256-mzNy5GPlB2qkI2KEAErJQzO//uo8yO0kPQUwvGDwR4w=";
          };
        } );
      });
    })
  ];

  environment.systemPackages = (with pkgs; [
    gnome.gnome-tweaks
    adw-gtk3
  ]) ++ (with pkgs.gnomeExtensions; [
    dash-to-panel
    app-hider
    appindicator
    blur-my-shell
    legacy-gtk3-theme-scheme-auto-switcher
    night-theme-switcher
  ]);

  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    cheese
    epiphany
    tali
    iagno
    hitori
    atomix
  ]);
}
