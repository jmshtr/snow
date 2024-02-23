{
  description = "NixOS configuration of James Hunter";

  # ------------------------------------------------------------------------------------------
  #
  # Looking for a beginner-friendly NixOS & Flakes tutorial?
  # Check out: https://nixos-and-flakes.thiscute.world/ !
  #
  # ------------------------------------------------------------------------------------------

  # Input sources for the Nix expressions.
  inputs = {
    # Pin our primary nixpkgs repository. This is the main nixpkgs repository
    # we'll use for our configurations. Be very careful changing this because
    # it'll impact your entire system.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # Outputs based on the specified inputs.
  outputs = inputs @ { self, nixpkgs, home-manager, ... }: 
  {
    # Different NixOS configurations for my laptop and desktop.
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./hosts/laptop

          # Include home-manager module for laptop configuration.
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

          # Include home-manager module for desktop configuration.
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = inputs;
            home-manager.users.james = import ./home;
          }
        ];
      };
    };
  };
}