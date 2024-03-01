{ pkgs, ... }: 

{
  home.packages = with pkgs; [
    fish    # An alternative shell with powerful features
    zellij  # A terminal workspace with tmux-like features
    eza     # A package for XYZ
    atuin   # A simple, easy-to-use window manager for X11
  ];
}