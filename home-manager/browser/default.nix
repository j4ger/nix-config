{
  inputs,
  ...
}:
{
  home = {
    sessionVariables = {
      BROWSER = "zen-beta";
      EDITOR = "zeditor";
    };
    sessionPath = [
      "$HOME/.cargo/bin"
    ];
  };
  programs.firefox = {
    enable = false;
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
  };

  xdg.mime.enable = true;
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "zen-beta.desktop";
      "text/xml" = "zen-beta.desktop";
      "x-scheme-handler/http" = "zen-beta.desktop";
      "x-scheme-handler/https" = "zen-beta.desktop";
      "x-scheme-handler/chrome" = "zen-beta.desktop";
      "application/x-extension-htm" = "zen-beta.desktop";
      "application/x-extension-html" = "zen-beta.desktop";
      "application/x-extension-shtml" = "zen-beta.desktop";
      "application/xhtml+xml" = "zen-beta.desktop";
      "application/x-extension-xhtml" = "zen-beta.desktop";
      "application/x-extension-xht" = "zen-beta.desktop";
    };
  };

  programs.chromium = {
    enable = true;
    commandLineArgs = [ "--enable-wayland-ime" ];
  };
}
