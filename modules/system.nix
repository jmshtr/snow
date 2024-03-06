{ pkgs, lib, ... }:

{
  users.users.james = { # Define user 'james'
    isNormalUser = true;
    description = "James";
    extraGroups = [ 
      "wheel" 
      "video" 
      "audio" 
      "disk" 
      "networkmanager" 
      "vboxusers" 
      "docker"
    ];
  };

  nix.settings = { # Define settings for Nix.
    trusted-users = ["james"];
    experimental-features = ["nix-command" "flakes"];
    substituters = ["https://cache.nixos.org"];
    trusted-public-keys = ["cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="];
    builders-use-substitutes = true;
  };

  nix.gc = { # Garbage collection settings for Nix.
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than 7d";
  };

  nixpkgs.config = { # Configuration settings for Nixpkgs.
    allowUnfree = true;
    allowAliases = false;
    chromium.enableWideVine = true;
  };

  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = builtins.mapAttrs (name: _: "en_GB.UTF-8") {
    LC_ADDRESS = null; LC_IDENTIFICATION = null; LC_MEASUREMENT = null; LC_MONETARY = null; 
    LC_NAME = null; LC_NUMERIC = null; LC_PAPER = null; LC_TELEPHONE = null; LC_TIME = null;
  };

  programs.dconf.enable = true;
  networking.firewall.enable = false;

  sound.enable = true;
  hardware.pulseaudio.enable = false;

  security.polkit.enable = true;

  services = { # Additional services configuration.
    dbus.packages = [pkgs.gcr];
    geoclue2.enable = true;
    flatpak.enable = true;
    power-profiles-daemon.enable = true;
    printing.enable = true;
    udev.packages = with pkgs; [gnome.gnome-settings-daemon];

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
}
