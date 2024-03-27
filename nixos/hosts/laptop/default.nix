{ config, pkgs, ... }:

{
  imports = [
    ../../default.nix
    ./hardware-configuration.nix
  ];

  boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_6;

  networking.hostName = "laptop";

  services.xserver = {
    xkbVariant = "mac";
    libinput.enable = true;
    videoDrivers = [ "intel" ];
  };

  #services.mbpfan = {
  #  enable = true;
  #  settings.general = {
  #    low_temp = 63;
  #    high_temp = 76;
  #    max_temp = 88;
  #  };
  #};

  # Required for screen-lock-on-suspend functionality.
  services.logind.extraConfig = ''
    LidSwitchIgnoreInhibited=False
    HandleLidSwitch=suspend
    HoldoffTimeoutSec=10
  '';

  hardware.facetimehd.enable = true;
}
