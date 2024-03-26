{ pkgs, config, ...}: 

{
  home.packages = with pkgs; [
    librewolf # A privacy-focused web browser
  ];

  programs.firefox = {
    enable = true;
    profiles.james = {};
/*
      # Check about:policies#documentation for options.
      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableFirefoxAccounts = false;
        DontCheckDefaultBrowser = true;
        SearchBar = "unified";
        DisplayBookmarksToolbar = "newtab";

        # Check about:config for options.
        Preferences = { 
          "extensions.pocket.enabled" = "false";
          "browser.tabs.tabmanager.enabled" = "false";
          "browser.compactmode.show" = "true";
          "browser.uidensity" = "1";
          "toolkit.legacyUserProfileCustomizations.stylesheets" = "true";
        };
      };

      profiles = {
        james = {
          id = 0;
          name = "james";
          isDefault = true;
        };
      };*/
  };
}