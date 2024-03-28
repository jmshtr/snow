{ pkgs, ... }: 

{
  home.packages = with pkgs; [
    atuin
    bat
    betterdiscordctl
    btop
    chezmoi
    du-dust
    eza
    expect
    fzf
    thefuck
    tldr
    tree
    xdg-utils
    zellij
  ];
}
