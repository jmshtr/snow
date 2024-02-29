{ config, pkgs, ... }:

{
  description = "Configuration for my desktop machine.";

  imports = [
    ../../modules/system.nix
    ../../modules/gnome.nix
    ../common.nix
    ./hardware-configuration.nix
  ];

  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "desktop";

  services.xserver.videoDrivers = [ "amdgpu" ];

  hardware.opengl = {
    driSupport = true;
    driSupport32Bit = true;
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = true;
  };
}
