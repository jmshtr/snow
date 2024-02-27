{ pkgs, config, ... }:

{
  home.packages = with pkgs; [ pulsemixer ];

  programs = {
    mpv = {
      enable = true;
      defaultProfiles = ["gpu-hq"];
      scripts = [ pkgs.mpvScripts.mpris ];
    };
  };
}
