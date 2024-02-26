{ pkgs, ...}: 

{
  # Packages to be installed in the home environment, including GitHub CLI.
  home.packages = [pkgs.gh];

  # Configure Git program settings.
  programs.git = {
    enable = true;  # Enable Git
    userName = "jmshtr";  # Set user name
    userEmail = "157889640+jmshtr@users.noreply.github.com";  # Set user email
  };
}