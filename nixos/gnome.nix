{ pkgs, ... }:

{
  services.xserver = { # Configuration for X server.
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
  };

  nixpkgs.overlays = [ # Define package overlays for Nixpkgs.
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
    # Essential GNOME applications and tools
    adw-gtk3                  # Adwaita GTK theme with GNOME's gtk.css
    gnome.gnome-tweaks        # Advanced desktop configuration
    gnome-extension-manager   # Desktop app for managing GNOME shell extensions
  ]) ++ (with pkgs.gnomeExtensions; [
    # GNOME Shell extensions
    app-hider                 # Hide running applications from the overview
    appindicator              # Adds AppIndicator, KStatusNotifierItem and legacy Tray icons support to the Shell
    blur-my-shell             # Provides a blur effect for GNOME Shell
    just-perfection           # Customizes various UI elements
    legacy-gtk3-theme-scheme-auto-switcher  # Automatically switch to the correct gtk.css for the selected gtk3-theme
    night-theme-switcher      # Automatically switch between light and dark themes based on sunset/sunrise times
    noannoyance-fork          # Suppress various system notifications
  ]);

  environment.gnome.excludePackages = (with pkgs; [
    # GNOME applications to exclude
    gnome-tour  # A guided tour of GNOME Shell
  ]) ++ (with pkgs.gnome; [
    # Additional GNOME applications to exclude
    atomix      # A puzzle game for GNOME
    cheese      # A webcam application for GNOME
    epiphany    # Asimple web browser
    hitori      # Hitori puzzle game for GNOME
    iagno       # A GNOME version of Reversi
    tali        # A dice game for GNOME
  ]);

}
