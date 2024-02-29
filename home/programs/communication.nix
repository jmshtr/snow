{ pkgs, ... }: 

{
  home.packages = with pkgs; [
    discord # Discord, a VoIP, instant messaging and digital distribution platform
  ];
}
