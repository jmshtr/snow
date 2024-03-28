{ config, pkgs, ... }:

{
  imports = [
    ./programs
    ./home.nix
  ];

  home = {
    username = "james";
    homeDirectory = "/home/james";
    stateVersion = "23.11";
  };

  xdg.cacheHome = "/home/james/.local/cache";

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      temp = "nix-shell -p";
      laptop = "nixos-rebuild switch --flake path:.#laptop";
      desktop = "nixos-rebuild switch --flake path:.#desktop";
      sudo = "sudo ";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" ];
      theme = "fishy";
    };
  };

  programs.home-manager.enable = true;
}
