{ config, pkgs, ... }:

{
  imports = [
    ../../modules/system.nix
    ../../modules/gnome.nix
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelModules = [ "wl" ];
  boot.extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_6;

  networking.hostName = "laptop";
  networking.networkmanager.enable = true;

  console.keyMap = "uk";

  services.xserver.libinput.enable = true;

  services.logind.extraConfig = ''
    LidSwitchIgnoreInhibited=False
    HandleLidSwitch=suspend
    HoldoffTimeoutSec=10
  '';

  hardware.facetimehd.enable = true;

  programs.hyprland.enable = true;

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];

  system.stateVersion = "23.11";
}
