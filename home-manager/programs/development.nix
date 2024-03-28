{ pkgs, ... }:

{
  home.packages = with pkgs; [
    github-desktop
    git
    nodejs
    nodePackages.npm
    nodePackages.pnpm
    poetry
    python3
    yarn
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      # TODO: add extensions here
    ];
  };
}
