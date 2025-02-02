{inputs, ...}: {
  imports = [inputs.hyprpanel.homeManagerModules.hyprpanel];

  programs.hyprpanel = {
    enable = true;
    hyprland.enable = true;
    overwrite.enable = true;

    theme = "catppuccin_macchiato";

    settings = {
      bar = {
        clock.format = "%m-%d %H:%M:%S";
        launcher.icon = "󱄅";
        media.show_active_only = true;
        network.showWifiInfo = true;

        workspaces = {
          show_numbered = true;
          numbered_active_indicator = "color";
        };
      };

      menus = {
        clock = {
          time = {
            hideSeconds = false;
            military = true;
          };

          weather.enabled = false;
        };

        dashboard = {
          controls.enabled = false;
          directories.enabled = false;
          shortcuts.enabled = false;
        };

        power = {
          lowBatteryNotification = true;
        };
      };

      wallpaper.enable = false;

      theme.osd = {
        location = "bottom";
        orientation = "horizontal";
        margins = "10px 10px 10px 10px";
        opacity = 80;
      };

      theme.font.size = "1.0rem";
    };
  };
}
