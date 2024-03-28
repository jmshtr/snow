{ pkgs, ... }:

{
  services.xserver = {
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
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
    adw-gtk3
    gnome.gnome-tweaks
    gnome-extension-manager
  ]) ++ (with pkgs.gnomeExtensions; [
    app-hider
    appindicator
    blur-my-shell
    just-perfection
    legacy-gtk3-theme-scheme-auto-switcher
    night-theme-switcher
    noannoyance-fork
  ]);

  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    atomix
    cheese
    epiphany
    hitori
    iagno
    tali
  ]);
}
