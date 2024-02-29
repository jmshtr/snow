{ pkgs, ... }: 

{
  home.packages = with pkgs; [
    fish      # Fish shell, an alternative shell with powerful features
    openssl   # Secure Sockets Layer and Transport Layer Security toolkit
    expect    # Scripting language for automating interactive applications
    du-dust   # du-dust, a more intuitive version of 'du' for disk usage analysis
    bat       # bat, a cat clone with syntax highlighting and Git integration
    tldr      # tldr, a collection of community-driven simplified man pages
    zellij    # zellij, a terminal workspace with tmux-like features
    tree      # tree, display directory structures in a tree-like format
  ];
}
