{ pkgs, ... }: 

{
  home.packages = with pkgs; [
    btop      # Process viewer and system monitor
    fzf       # Command-line fuzzy finder
    xdg-utils # Command line utilities for desktop integration
    expect    # Scripting language for automating interactive applications
    du-dust   # More intuitive version of 'du' for disk usage analysis
    bat       # Cat clone with syntax highlighting and Git integration
    tldr      # Collection of community-driven simplified man pages
    tree      # Display directory structures in a tree-like format

    zellij    # Terminal workspace with tmux-like features
    eza       # Package for XYZ
    atuin     # Simple, easy-to-use window manager for X11

    megasync
  ];
}
