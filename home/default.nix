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

  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';
    shellAliases = { };
  };

  programs.home-manager.enable = true;
}
