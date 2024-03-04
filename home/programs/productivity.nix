{ pkgs, ... }: 

{
  home.packages = with pkgs; [
    chezmoi             # A tool for managing your dotfiles
    onlyoffice-bin_7_5  # An office suite
    github-desktop      # GitHub Desktop application
    thunderbird         # A full-featured e-mail client
  ];
}