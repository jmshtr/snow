{ pkgs, config, ...}: 

  # ------------------------------------------------------------------------------------------
  #
  # Configuration for web browsers.
  #
  # ------------------------------------------------------------------------------------------

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