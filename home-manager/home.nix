{ pkgs, ... }:

{
  gtk = {
    enable = true;

    iconTheme = {
      package = pkgs.gnome.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      name = "Sans";
      size = 11;
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-hint-font-metrics = 1
      '';
    };
  };
}