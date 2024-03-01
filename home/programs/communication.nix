{ pkgs, ... }: 

{
  home.packages = with pkgs; [
    discord          # A VoIP, instant messaging and digital distribution platform
    betterdiscordctl # A utility for managing BetterDiscord on Linux
  ];
}
