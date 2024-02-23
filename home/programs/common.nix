{ lib, pkgs, ... }: 

  # ------------------------------------------------------------------------------------------
  #
  # Configuration for various packages to be installed in the user's home environment.
  # These packages are used by both machines.
  #
  # ------------------------------------------------------------------------------------------
  
{
  # Packages to be installed in the home environment.
  home.packages = with pkgs; [
    firefox
    librewolf
    ungoogled-chromium
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
  ];

  # Configure programs in the home environment.
  programs = {
    btop.enable = true;  # Enable btop as a replacement for htop.
  };
}