{ pkgs, config, ... }:

{
  # Packages to be installed in the home environment.
  home.packages = with pkgs; [
    pulsemixer  # audio control
  ];

  # Configure programs in the home environment.
  programs = {
    # Configure mpv program.
    mpv = {
      enable = true;
      defaultProfiles = ["gpu-hq"];
      scripts = [pkgs.mpvScripts.mpris];
    };
  };
}