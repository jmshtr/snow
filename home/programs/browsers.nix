{ pkgs, config, ...}: 

{
  # Programs configuration.
  programs = {
    # Configure Firefox program.
    firefox = {
      enable = true;
      profiles.james = {};
    };
  };
}