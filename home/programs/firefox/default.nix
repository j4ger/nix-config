{ pkgs, ... }:
let
  chromeFile = pkgs.fetchurl {
    url = "https://github.com/betterbrowser/arcfox/releases/download/2.4.3/userChrome.css";
    hash = "sha256-Zk0XROBqYMGptg3PD40yUOEKUhWGsG6cU4MgHuHW+nQ=";
  };
in
{
  home = {
    sessionVariables = {
      BROWSER = "firefox";
      MOZ_ENABLE_WAYLAND = "1";
    };
  };
  programs.firefox = {
    enable = true;
    policies = {
      DisplayBookmarksToolbar = true;
      Preferences = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "media.ffmpeg.vaapi.enabled" = true;
      };
    };
    profiles.default = {
      userChrome = ( builtins.readFile chromeFile );
    };
  };

}
