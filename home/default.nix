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

  home.file = {
    # ".screenrc".source = dotfiles/screenrc;
    # ".gradle/gradle.properties".text = '';
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    initExtra = ''. "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"'';
    bashrcExtra = ''export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"'';
    profileExtra = ''
    . "/home/james/.sh/mount_nextcloud.sh"
    export XDG_DATA_DIRS=$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share
    '';
    shellAliases = {};
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;
}
