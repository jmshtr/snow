{ config, pkgs, ... }:

  # ------------------------------------------------------------------------------------------
  #
  # Sets up the configuration for Home Manager, a tool used to manage 
  # user configurations in the Nix ecosystem.
  #
  # ------------------------------------------------------------------------------------------

{

  imports = [
    ./programs
    ./home.nix
  ];

  # Home Manager needs a bit of information about you 
  # and the paths it should manage.
  home = {
    username = "james";
    homeDirectory = "/home/james";

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "23.11";
  };

  xdg.cacheHome = "/home/james/.local/cache";

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # symlink to the Nix store copy.
    #".screenrc".source = dotfiles/screenrc;

    # You can also set the file content immediately.
    #".gradle/gradle.properties".text = ''
    #  org.gradle.console=verbose
    #  org.gradle.daemon.idletimeout=3600000
    #'';
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    initExtra = ''
      . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
    '';

    # TODO add your custom .bashrc here
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';

    # TODO add your custom .profile here
    profileExtra = ''
      . "/home/james/Documents/Bash Scripts/mount_nextcloud.sh"
    '';

    # set some aliases, feel free to add more or remove some
    shellAliases = {
      urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
      urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
    };
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/james/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    #EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}