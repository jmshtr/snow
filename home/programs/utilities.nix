{ pkgs, ... }: 

{
  home.packages = with pkgs; [
    btop      # Process viewer and system monitor
    fzf       # Command-line fuzzy finder
    xdg-utils # Command line utilities for desktop integration
    expect    # Scripting language for automating interactive applications
    du-dust   # A more intuitive version of 'du' for disk usage analysis
    bat       # A cat clone with syntax highlighting and Git integration
    tldr      # A collection of community-driven simplified man pages
    tree      # Display directory structures in a tree-like format
  ];
}
