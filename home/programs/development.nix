{ pkgs, ... }: 

{
  home.packages = with pkgs; [    
    git               # Version control system
    poetry            # Python dependency management tool
    python3           # Python programming language
    nodejs            # Node.js runtime environment
    nodePackages.npm  # Node Package Manager
    nodePackages.pnpm # Fast, disk space efficient package manager
    yarn              # Fast, reliable, and secure dependency management
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      # add extensions here
    ];
  };
}
