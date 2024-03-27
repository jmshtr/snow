{
  description = "NixOS configuration of James Hunter";

  inputs = { # Inputs required for the configuration.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #hardware.url = "github:nixos/nixos-hardware";

    #nur.url = "github:nix-community/NUR";

    #spicetify-nix.url = "github:the-argus/spicetify-nix";
  };

  outputs = inputs @ { self, nixpkgs, home-manager, ... }: 
  {
    nixosConfigurations = {
      # Definitions of different NixOS configurations.
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          # List of modules to include in the configuration.
          ./nixos/hosts/laptop
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = inputs;
            home-manager.users.james = import ./home-manager;
          }
        ];
      };

      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          # List of modules to include in the configuration.
          ./nixos/hosts/desktop
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = inputs;
            home-manager.users.james = import ./home-manager;
          }
        ];
      };
    };
  };
}
