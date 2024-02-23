
  # ------------------------------------------------------------------------------------------
  #
  # Import configurations from several other Nix files.
  # Each of these files contains configurations related to specific aspects 
  # of the system setup, such as web browsers, common packages, 
  # Git configuration, media applications, and XDG (Cross Desktop Group) standards.
  #
  # ------------------------------------------------------------------------------------------

{
  imports = [
    ./browsers.nix
    ./common.nix
    ./git.nix
    ./media.nix
    ./xdg.nix
  ];
}