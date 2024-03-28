{ pkgs, ... }: 

{
  home.packages = with pkgs; [
    onlyoffice-bin_7_5
  ];
}