{ lib, pkgs, ... }: 

{
  # Packages to be installed in the home environment.
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

  # Configure programs in the home environment.
  programs = {
    btop.enable = true;  # Enable btop as a replacement for htop.
  };
}
