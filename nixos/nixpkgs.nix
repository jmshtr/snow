{ pkgs, ... }:

{
  # Configuration settings for Nixpkgs.
  nixpkgs.config = { 
    allowUnfree = true;
    allowAliases = false;
  };

  # Override packages
  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };
}