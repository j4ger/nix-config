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
        corner_radius_scale = 1;
        font_family = "Noto Sans CJK SC";
        time_format = "{:%H:%M:%S}";
        date_format = "%A, %x";
        clipboard_enabled = true;
        clipboard_history_max_entries = 100;
        shared_gl_context = true;
        settings_show_advanced = false;
        avatar_path = "${config.home.homeDirectory}/.face.icon";
        niri_overview_type_to_launch_enabled = true;
        polkit_agent = true;

        animation = {
          enabled = true;
          speed = 1;
        };

        shadow = {
          direction = "down";
          alpha = 0.55;
        };

        panel = {
          transparency_mode = "soft";
          launcher_placement = "centered";
          session_placement = "centered";
          open_near_click_control_center = true;
        };

        mpris = {
          blacklist = [ ];
        };
      };

      backdrop = {
        enabled = true;
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
        builtin = "Catppuccin";
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
        position = "bottom_center";
        orientation = "horizontal";
        background_opacity = 0.97;
      };

      lockscreen = {
        enabled = true;
        blurred_desktop = true;
      };

      lockscreen_widgets = {
        enabled = true;
        schema_version = 2;
        widget_order = [
          "lockscreen-login-box@DP-2"
          "lockscreen-login-box@eDP-1"
          "lockscreen-widget-0000000000000001"
        ];

        grid = {
          visible = true;
          cell_size = 24;
          major_interval = 4;
        };

        widget = {
          "lockscreen-login-box@DP-2" = {
            type = "login_box";
            output = "DP-2";
            cx = 1024.0;
            cy = 1029.0;

            settings = {
              background_color = "surface_variant";
              background_opacity = 0.88;
              background_radius = 12.0;
              input_opacity = 1.0;
              input_radius = 6.0;
              show_login_button = true;
            };
          };

          "lockscreen-login-box@eDP-1" = {
            type = "login_box";
            output = "eDP-1";
            cx = 854.0;
            cy = 944.0;

            settings = {
              background_color = "surface_variant";
              background_opacity = 0.88;
              background_radius = 12.0;
              input_opacity = 1.0;
              input_radius = 6.0;
              show_login_button = true;
            };
          };

          "lockscreen-widget-0000000000000001" = {
            type = "clock";
            output = "DP-2";
            cx = 1024.0;
            cy = 456.0;
            box_width = 360.0;
            box_height = 192.0;

            settings = {
              format = "{:%H:%M:%S}";
              center_text = true;
            };
          };
        };
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
        temperature_night = 4500;
      };

      location = {
        auto_locate = true;
        address = "Shenzhen, China";
      };

      weather = {
        enabled = true;
        unit = "celsius";
        effects = true;
        refresh_minutes = 30;
      };

      idle = {
        pre_action_fade_seconds = 5;
        behavior_order = [
          "lock"
          "screen-off"
          "lock-and-suspend"
        ];

        behavior = {
          lock = {
            enabled = true;
            timeout = 300;
            action = "lock";
          };

          "screen-off" = {
            enabled = true;
            timeout = 600;
            action = "screen_off";
          };

          "lock-and-suspend" = {
            enabled = true;
            timeout = 1800;
            action = "lock_and_suspend";
          };
        };
      };

      bar = {
        main = {
          position = "right";
          background_opacity = 0.75;
          capsule = false;
          margin_h = 180;
          margin_v = 10;
          margin_edge = 0;
          margin_ends = 0;
          padding = 12;
          radius = 0;
          thickness = 42;
          widget_spacing = 6;

          start = [
            "media"
            "volume"
            "system-monitor"
          ];
          center = [
            "active-window"
            "workspaces"
            "taskbar"
          ];
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
          { type = "wallpaper"; }
          { type = "power_profile"; }
          { type = "caffeine"; }
          { type = "nightlight"; }
        ];
      };

      plugins = {
        enabled = [ ];
      };

      widget = {
        tray = {
          capsule = true;
        };
        battery = {
          capsule = true;
          show_label = true;
          hide_when_full = true;
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
