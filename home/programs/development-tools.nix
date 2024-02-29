{ pkgs, ... }: 

{
  home.packages = with pkgs; [
    vscodium            # Visual Studio Code without the Microsoft branding
    onlyoffice-bin_7_5  # OnlyOffice, an office suite
    github-desktop      # GitHub Desktop application
    btop                # Process viewer and system monitor
    xdg-utils           # Command line utilities for desktop integration
    fzf                 # Command-line fuzzy finder
    atuin               # Atuin, a simple, easy-to-use window manager for X11
    chezmoi             # Chezmoi, a tool for managing your dotfiles
    eza                 # eza, a package for XYZ
  ];
}
