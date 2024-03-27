{ pkgs, ... }: 

{
  home.packages = with pkgs; [
    libgcc  # GCC support library
  ];
}
