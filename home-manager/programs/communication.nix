{ pkgs, ... }: 

{
  home.packages = with pkgs; [
    discord           # VoIP, instant messaging and digital distribution platform
    betterdiscordctl  # Utility for managing BetterDiscord on Linux
  ];
}
