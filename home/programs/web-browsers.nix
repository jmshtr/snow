{ pkgs, config, ...}: 

{
  home.packages = with pkgs; [
      firefox       # Mozilla Firefox web browser
      librewolf     # Librewolf, a privacy-focused web browser
      google-chrome # Google Chrome web browser
  ];

  programs.firefox = {
    enable = true;
    profiles.james = {};
  };
}
