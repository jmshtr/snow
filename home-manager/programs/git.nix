{ pkgs, ... }: 

{
  home.packages = [ pkgs.gh ];
  programs.git = {
    enable = true;
    userName = "jmshtr";
    userEmail = "157889640+jmshtr@users.noreply.github.com";
  };
}
