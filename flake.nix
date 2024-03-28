{
  description = "NixOS configuration of James Hunter";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
   
    #hardware.url = "github:nixos/nixos-hardware";

    #nur.url = "github:nix-community/NUR";

    #spicetify-nix.url = "github:the-argus/spicetify-nix";
  };

  outputs = inputs @ { 
    self, 
    nixpkgs,
    home-manager, 
    nix-index-database, 
    ... 
    }: 
  {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./nixos/hosts/laptop
          nix-index-database.nixosModules.nix-index
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; };
              users = {
                james = import ./home-manager;
              };
            };
            programs = {
              command-not-found = { enable = false; };
              nix-index = { enable = true; };
            };
          }
        ];
      };

      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./nixos/hosts/desktop
          nix-index-database.nixosModules.nix-index
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; };
              users = {
                james = import ./home-manager;
              };
            };
            programs = {
              command-not-found = { enable = false; };
              nix-index = { enable = true; };
            };
          }
        ];
      };
    };
  };
}
