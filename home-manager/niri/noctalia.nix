{
  config,
  ...
}:
{
  home.sessionVariables = {
    QS_ICON_THEME = "Vimix";
  };

  programs.noctalia = {
    enable = true;
    settings = {
      shell = {
        ui_scale = 1;
        corner_radius_scale = 0.5;
        font_family = "Noto Sans CJK SC";
        time_format = "{:%H:%M}";
        date_format = "%A, %x";
        clipboard_enabled = true;
        clipboard_history_max_entries = 100;
        shared_gl_context = true;
        settings_show_advanced = false;
        avatar_path = "${config.home.homeDirectory}/.face.icon";

        animation = {
          enabled = true;
          speed = 1;
        };

        shadow = {
          direction = "down";
          alpha = 0.55;
        };

        panel = {
          transparency_mode = "solid";
          launcher_placement = "centered";
        };

        mpris = {
          blacklist = [ ];
        };
      };

      wallpaper = {
        enabled = true;
        fill_mode = "crop";
        fill_color = "#000000";
        transition = [
          "fade"
          "wipe"
          "disc"
          "stripes"
          "zoom"
          "honeycomb"
        ];
        transition_duration = 1500;
        edge_smoothness = 0.05;
        directory = "${config.home.homeDirectory}/Pictures/Wallpapers";

        default = {
          path = "";
        };

        automation = {
          enabled = true;
          interval_minutes = 15;
          order = "random";
          recursive = true;
        };

        monitor = {
          eDP-1 = {
            directory = "${config.home.homeDirectory}/Pictures/Wallpapers";
          };
          DP-2 = {
            directory = "${config.home.homeDirectory}/Pictures/Wallpapers";
          };
        };
      };

      theme = {
        mode = "dark";
        source = "wallpaper";
        wallpaper_scheme = "m3-rainbow";

        templates = {
          enable_builtin_templates = true;
        };
      };

      notification = {
        enable_daemon = true;
        show_app_name = true;
        show_actions = true;
        position = "top_right";
        layer = "top";
        background_opacity = 0.97;
      };

      osd = {
        position = "top_right";
        orientation = "horizontal";
        background_opacity = 0.97;
      };

      lockscreen = {
        enabled = true;
        blurred_desktop = false;
      };

      system.monitor = {
        enabled = true;
        cpu_poll_seconds = 2.0;
        gpu_poll_seconds = 0;
        memory_poll_seconds = 2.0;
        network_poll_seconds = 3.0;
        disk_poll_seconds = 10.0;
      };

      audio = {
        enable_overdrive = false;
      };

      brightness = {
        enable_ddcutil = false;
      };

      battery = {
        warning_threshold = 20;
      };

      nightlight = {
        enabled = true;
        force = false;
        temperature_day = 6500;
        temperature_night = 5000;
      };

      location = {
        auto_locate = false;
        address = "Shenzhen, China";
      };

      weather = {
        enabled = true;
        unit = "celsius";
        effects = true;
        refresh_minutes = 30;
      };

      bar = {
        main = {
          position = "right";
          background_opacity = 1;
          capsule = false;
          margin_h = 180;
          margin_v = 10;
          padding = 14;
          widget_spacing = 6;

          start = [
            "media"
            "volume"
            "system-monitor"
            "taskbar"
            "active-window"
          ];
          center = [ "workspaces" ];
          end = [
            "tray"
            "battery"
            "brightness"
            "network"
            "bluetooth"
            "clock"
            "notifications"
            "control-center"
          ];
        };
      };

      dock = {
        enabled = false;
      };

      control_center = {
        shortcuts = [
          { type = "wifi"; }
          { type = "bluetooth"; }
          { type = "screen_recorder"; }
          { type = "wallpaper"; }
          { type = "notification"; }
          { type = "power_profile"; }
          { type = "caffeine"; }
          { type = "nightlight"; }
        ];
      };

      widget = {
        tray = {
          capsule = true;
        };
        battery = {
          capsule = true;
        };
        brightness = {
          capsule = true;
        };
        network = {
          capsule = true;
        };
        bluetooth = {
          capsule = true;
        };
        clock = {
          format = "{:%H:%M}\n{:%d/%m}";
          vertical_format = "{:%H\n%M}";
          tooltip_format = "{:%A, %B %d, %Y}";
          capsule = true;
        };
        notifications = {
          hide_when_no_unread = false;
          capsule = true;
        };
        "control-center" = {
          capsule = true;
        };
        volume = {
          capsule = true;
        };
        "system-monitor" = {
          capsule = true;
        };
        taskbar = {
          capsule = true;
        };
        "active-window" = {
          capsule = true;
        };
        media = {
          capsule = true;
        };
        workspaces = {
          capsule = true;
        };
        launcher = {
          capsule = true;
        };
      };
    };
  };
}
