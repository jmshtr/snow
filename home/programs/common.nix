{ lib, pkgs, ... }: 

{
  home.packages = (with pkgs; [
    firefox
    librewolf
    google-chrome
    vscodium
    onlyoffice-bin_7_5
    discord
    github-desktop
    htop
    xdg-utils
    nodejs
    nodePackages.npm
    nodePackages.pnpm
    yarn
    openssl
    expect
  ]);

  programs.btop.enable = true;
}
