{ pkgs, config, ...}: 

{
  home.packages = with pkgs; [
    librewolf     # A privacy-focused web browser
    google-chrome # Google Chrome web browser
  ];

  programs.firefox = {
    enable = true;
    profiles.james = {};
  };
}
