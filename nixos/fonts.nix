{ pkgs, ... }:

{
  fonts = {
    fontDir.enable= true;
    enableDefaultPackages = true;
    enableGhostscriptFonts = true;

    packages = with pkgs; [
      corefonts
      dejavu_fonts
      inconsolata
      liberation_ttf
      terminus_font
      ubuntu_font_family
      unifont
      jetbrains-mono
      nerd-font-patcher
    ];
  };
}