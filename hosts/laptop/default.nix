{ config, pkgs, ... }:

  # ------------------------------------------------------------------------------------------
  #
  # Configuration to ensure proper hardware support for my laptop, including Wi-Fi, 
  # touchpad, and power management features like screen-lock-on-suspend.
  #
  # ------------------------------------------------------------------------------------------

{
  imports = [
    ../../modules/system.nix
    ../../modules/gnome.nix

    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Install broadcom drivers.
  boot.kernelModules = [ "wl" ];
  boot.extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];

  # Use the latest kernel.
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_6; #pkgs.linuxPackages_latest;

  networking.hostName = "laptop"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  #networking.proxy.default = "http://user:password@proxy:port/";
  #networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  #networking.defaultGateway = "192.168.5.201";

  # Configure console keymap
  console.keyMap = "uk";

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Required for screen-lock-on-suspend functionality.
  services.logind.extraConfig = ''
    LidSwitchIgnoreInhibited=False
    HandleLidSwitch=suspend
    HoldoffTimeoutSec=10
  '';

  # Enable Facetime webcam.
  hardware.facetimehd.enable = true;
  
  # Enable Hyprland
  programs.hyprland.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}

