{ pkgs, config, ... }:

{
  imports = [
    ./bootloader.nix
    ./firewall.nix
    ./fonts.nix
    ./gc.nix
    ./gnome.nix
    ./locale.nix
    ./networking.nix
    ./nix-settings.nix
    ./nixpkgs.nix
    ./security-services.nix
    ./services.nix
    ./sound.nix
    ./time.nix
    ./users.nix
    ./virtualisation.nix
  ];

  system.stateVersion = "23.11";
}
