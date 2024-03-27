{ pkgs, ... }:

{
  programs.dconf.enable = true;

  services = {
    xserver.enable = true;
    dbus.packages = [pkgs.gcr];
    geoclue2.enable = true;
    power-profiles-daemon.enable = true;
    printing.enable = true;
    udev.packages = with pkgs; [gnome.gnome-settings-daemon];
  };
}