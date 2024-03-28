{ pkgs, ... }: 

{
  home.packages = with pkgs; [
    authenticator
    keepassxc  
  ];
}