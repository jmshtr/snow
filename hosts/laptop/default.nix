{ config, pkgs, ... }:

{
  description = "Configuration for my laptop machine.";

  imports = [
    ../../modules/system.nix
    ../../modules/gnome.nix
    ../common.nix
    ./hardware-configuration.nix
  ];

  boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_6;

  networking.hostName = "laptop";

  console.keyMap = "uk";

  services.xserver.libinput.enable = true;

  services.logind.extraConfig = ''
    LidSwitchIgnoreInhibited=False
    HandleLidSwitch=suspend
    HoldoffTimeoutSec=10
  '';

  hardware.facetimehd.enable = true;

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];
}
