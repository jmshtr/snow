{ pkgs, config, ... }:

{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    kernelModules = [ "wl" ];
    extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];
  };

  networking.networkmanager.enable = true;

  console.keyMap = "uk";

  virtualisation = {
    virtualbox.host.enable = true;
    docker.enable = true;
  };

  system.stateVersion = "23.11";
}