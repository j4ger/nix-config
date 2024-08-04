{ pkgs, inputs, ... }:
{
  home = {
    sessionVariables = {
      BROWSER = "firefox";
      #MOZ_ENABLE_WAYLAND = "1";
    };
  };
  programs.firefox = {
    enable = true;
    policies = {
      DisplayBookmarksToolbar = true;
      Preferences = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "media.ffmpeg.vaapi.enabled" = true;
        "svg.context-properties.content.enabled" = true;
        "uc.tweak.popup-search" = true;
        "uc.tweak.longer-sidebar" = true;
      };
    };
    profiles.default = {
      userChrome = ''
        @import "${inputs.arcwtf}/userChrome.css";
      '';
    };
  };

  programs.chromium = {
    enable = true;
    commandLineArgs = [ "--enable-wayland-ime" ];
  };
}
