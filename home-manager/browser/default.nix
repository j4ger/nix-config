{ pkgs, inputs, ... }:
{
  home = {
    sessionVariables = {
      BROWSER = "zen";
      #MOZ_ENABLE_WAYLAND = "1";
      EDITOR = "nvim";
      GDK_BACKEND = "wayland,x11";
      QT_QPA_PLATFORM = "wayland;xcb";
      #SDL_VIDEODRIVER = "x11";
      CLUTTER_BACKEND = "wayland";
      # XDG_CURRENT_DESKTOP = "plasma";
      XDG_SESSION_TYPE = "wayland";
      # XDG_SESSION_DESKTOP = "plasma";
      # WLR_NO_HARDWARE_CURSORS = "1";
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
