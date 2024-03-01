{ config, pkgs, ... }:

{
  imports = [
    ../../modules/system.nix
    ../../modules/gnome.nix
    ../common.nix
    ./hardware-configuration.nix
  ];

  boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_6;

  networking.hostName = "laptop";

  services.xserver = {
    libinput.enable = true;
    videoDrivers = [ "intel" ];
  };

  services.logind.extraConfig = ''
    LidSwitchIgnoreInhibited=False
    HandleLidSwitch=suspend
    HoldoffTimeoutSec=10
  '';

  hardware.facetimehd.enable = true;
}
