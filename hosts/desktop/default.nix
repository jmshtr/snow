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
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "desktop";
  networking.networkmanager.enable = true;

  services.xserver.videoDrivers = [ "amdgpu" ];

  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = true;
  };

  system.stateVersion = "23.11";
}
