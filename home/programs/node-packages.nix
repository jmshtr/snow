{ pkgs, ... }: 

{
  home.packages = with pkgs; [
    nodejs              # Node.js runtime environment
    nodePackages.npm    # Node Package Manager
    nodePackages.pnpm   # Fast, disk space efficient package manager
    yarn                # Fast, reliable, and secure dependency management
  ];
}
