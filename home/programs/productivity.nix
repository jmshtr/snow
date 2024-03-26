{ pkgs, ... }: 

{
  home.packages = with pkgs; [
    chezmoi             # Tool for managing your dotfiles
    onlyoffice-bin_7_5  # An office suite
    github-desktop      # GitHub Desktop application
    thunderbird         # Full-featured e-mail client
  ];
}