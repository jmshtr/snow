{ pkgs, lib, ... }: 

{
  # Define a user configuration
  users.users.james = {
    isNormalUser = true;
    description = "James";
    extraGroups = [ "wheel" "video" "audio" "disk" "networkmanager" "vboxusers" ];
  };

  # Given the users in this list the right to specify additional substituters via:
  #   1. `nixConfig.substituers` in `flake.nix`
  #   2. command line args `--options substituers http://xxx`
  nix.settings.trusted-users = ["james"];

  # Customise /etc/nix/nix.conf declaratively via `nix.settings`
  nix.settings = {
    # Enable flakes globally
    experimental-features = ["nix-command" "flakes"];

    # The Hyprland Cachix exists to cache the hyprland packages 
    # and any dependencies not found in cache.nixos.org.
    substituters = [
      "https://cache.nixos.org"
    ];

    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];
    builders-use-substitutes = true;
  };

  # Do garbage collection weekly to keep disk usage low.
  nix.gc = {
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than 7d";
  };

  nixpkgs.config = {
    allowUnfree = true; # Allow unfree packages.
    allowAliases = false; # Disable aliases for dynamic triple buffering to work.
    
    chromium = {
     enableWideVine = true;
    };
  };

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  # Extra locale settings for internationalisation.
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable dconf for program configuration.
  programs.dconf.enable = true;

  #networking.firewall.allowedTCPPorts = [ ... ];
  #networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Enable the OpenSSH daemon.
  #services.openssh.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search <package>
  environment.systemPackages = /*
  let
    facetimehd = with pkgs; stdenv.mkDerivation rec {
      name = "0.6.8";
      src = fetchurl {
        url = "https://github.com/patjak/facetimehd/archive/0.6.8.tar.gz";
        hash = "sha256-T20IcY2aqesTl5ldZqqy8P9KDejk1E0E8UiuIIsvuoo=";
      };
    };
  in
  [ facetimehd ] ++ */(with pkgs; [
    python3
    poetry
    libgcc
    git
  ]);

  # Configure various system services.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  services.power-profiles-daemon = {
    enable = true;
  };

  # Enable polkit for security.
  security.polkit.enable = true;

  services = {
    dbus.packages = [pkgs.gcr];

    geoclue2.enable = true;

    # Configure pipewire service.
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };

    # Define packages required by udev.
    udev.packages = with pkgs; [gnome.gnome-settings-daemon];
  };
}