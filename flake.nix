{
  description = "NixOS configuration of James Hunter";

  inputs = { # Inputs required for the configuration.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, home-manager, ... }: 
  {
    nixosConfigurations = {
      # Definitions of different NixOS configurations.
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          # List of modules to include in the configuration.
          ./hosts/laptop
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = inputs;
            home-manager.users.james = import ./home;
          }
        ];
      };

      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./hosts/desktop
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = inputs;
            home-manager.users.james = import ./home;
          }
        ];
      };

      # GRUB bootloader configuration
      boot.loader.grub = {
        enable = true;
        version = 2;
        showBootMessages = true;
      };
    };
  };
}
