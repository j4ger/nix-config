{
  inputs,
  config,
  pkgs,
  ...
}:
{
  imports = [
    inputs.niri.homeModules.niri

    ./noctalia.nix
  ];

  programs.niri = {
    enable = true;
    settings =
      with config.lib.niri.actions;
      {
        binds = let
          noctalia = cmd: [ "noctalia" "msg" ] ++ cmd;
        in
        {
          # Workspace-centric flow
          "Mod+J".action = focus-window-or-workspace-down;
          "Mod+K".action = focus-window-or-workspace-up;
          "Mod+Ctrl+J".action = move-workspace-down;
          "Mod+Ctrl+K".action = move-workspace-up;
          "Mod+Shift+J".action = move-window-down-or-to-workspace-down;
          "Mod+Shift+K".action = move-window-up-or-to-workspace-up;

          # Columns navigation
          "Mod+H".action = focus-column-or-monitor-left;
          "Mod+L".action = focus-column-or-monitor-right;
          "Mod+Ctrl+H".action = focus-monitor-left;
          "Mod+Ctrl+L".action = focus-monitor-right;
          "Mod+Shift+H".action = move-column-left-or-to-monitor-left;
          "Mod+Shift+L".action = move-column-right-or-to-monitor-right;
          "Mod+Alt+H".action = consume-or-expel-window-left;
          "Mod+Alt+L".action = consume-or-expel-window-right;

          # Window Actions
          "Mod+Q".action = close-window;
          "Mod+F".action = maximize-column;
          "Mod+Alt+F".action = expand-column-to-available-width;
          "Mod+Shift+F".action = toggle-windowed-fullscreen;
          "Mod+A".action = toggle-overview;
          "Mod+T".action = toggle-window-floating;
          "Mod+W".action = switch-preset-column-width;
          "Mod+Shift+W".action = switch-preset-column-width-back;

          # Screenshot
          "Mod+S".action.screenshot = [ ];
          "Mod+Shift+S".action.screenshot-window = {
            write-to-disk = false;
          };
          "Mod+Alt+Shift+S".action.screenshot-window = [ ];

          # Apps
          "Mod+Shift+Return".action = spawn "alacritty";
          "Mod+R".action = spawn "zen";

          # Scroll binds
          "Mod+WheelScrollDown".action = focus-workspace-down;
          "Mod+WheelScrollUp".action = focus-workspace-up;
          "Mod+Shift+WheelScrollDown".action = focus-column-or-monitor-right;
          "Mod+Shift+WheelScrollUp".action = focus-column-or-monitor-left;

          "Mod+TouchpadScrollDown".action = spawn "ydotool" "key" "29:1" "42:1" "15:1" "15:0" "42:0" "29:0";
          "Mod+TouchpadScrollUp".action = spawn "ydotool" "key" "29:1" "15:1" "15:0" "29:0";

          # Noctalia v5 IPC
          "Mod+D".action = spawn (noctalia [ "panel-toggle" "launcher" ]);
          "Mod+C".action = spawn (noctalia [ "panel-toggle" "control-center" ]);
          "Mod+P".action = spawn (noctalia [ "panel-toggle" "session" ]);
          "Mod+Shift+E".action = spawn (noctalia [ "panel-toggle" "session" ]);
          "Mod+Alt+E".action = spawn (noctalia [ "session" "lock" ]);
          "Mod+Ctrl+E".action = spawn (noctalia [ "caffeine-toggle" ]);
          "Mod+V".action = spawn (noctalia [ "panel-toggle" "clipboard" ]);
          "Mod+Shift+D".action = spawn (noctalia [ "panel-toggle" "launcher" ]);
          "Mod+N".action = spawn (noctalia [ "panel-toggle" "control-center" "notifications" ]);
          "Mod+Shift+N".action = spawn (noctalia [ "notification-dnd-toggle" ]);
          "Mod+Ctrl+N".action = spawn (noctalia [ "notification-clear-active" ]);
          "Mod+Alt+N".action = spawn (noctalia [ "notification-clear-history" ]);

          # Media / brightness
          "XF86AudioRaiseVolume".action = spawn (noctalia [ "volume-up" ]);
          "XF86AudioLowerVolume".action = spawn (noctalia [ "volume-down" ]);
          "XF86AudioMute".action = spawn (noctalia [ "volume-mute" ]);
          "XF86MonBrightnessUp".action = spawn (noctalia [ "brightness-up" ]);
          "XF86MonBrightnessDown".action = spawn (noctalia [ "brightness-down" ]);
        };

        "screenshot-path" = "~/Pictures/Screenshots/Screenshot-%Y%m%d-%H%M%S.png";

        "hotkey-overlay" = {
          "skip-at-startup" = true;
        };

        "prefer-no-csd" = true;

        "spawn-at-startup" = [
          { argv = [ "noctalia" ]; }
        ];

        # Session env vars (NIXOS_OZONE_WL, QT_QPA_PLATFORM, etc.) are set at
        # NixOS level in nixos/desktop/niri.nix environment.sessionVariables.

        # Cursor for niri compositor. Keep in sync with home.pointerCursor in desktop.nix.
        cursor = {
          theme = "Bibata-Modern-Ice";
          size = 24;
        };

        input = {
          focus-follows-mouse.enable = true;
          "mod-key" = "Super";
          touchpad = {
            tap = true;
            drag = true;
            "natural-scroll" = true;
            "drag-lock" = true;
            dwt = true;
          };
          # mouse = {
          #   "scroll-method" = "on-button-down";
          #   "scroll-button" = 276;
          #   "scroll-button-lock" = true;
          # };
        };

        outputs = {
          "eDP-1" = {
            position = {
              x = 0;
              y = 0;
            };
            scale = 1.5;
            "variable-refresh-rate" = true;
          };
          "DP-1" = {
            position = {
              x = 1707;
              y = 0;
            };
            scale = 1.25;
            "focus-at-startup" = true;
          };
          "DP-2" = {
            position = {
              x = 1707;
              y = 0;
            };
            scale = 1.25;
            "focus-at-startup" = true;
          };
          "DP-3" = {
            position = {
              x = 1707;
              y = 0;
            };
            scale = 1.5;
            "focus-at-startup" = true;
          };
        };

        "window-rules" = [
          {
            matches = [
            ];
            "geometry-corner-radius" =
              let
                radius = 12.;
              in
              {
                "bottom-left" = radius;
                "bottom-right" = radius;
                "top-left" = radius;
                "top-right" = radius;
              };
            "clip-to-geometry" = true;
          }
        ];

        layout = {
          gaps = 8;
          always-center-single-column = true;
          preset-column-widths = [
            { proportion = 0.33333; }
            { proportion = 0.66667; }
            { proportion = 0.5; }
          ];
        };

        debug = {
          render-drm-device = "/run/amd-igpu";
        };
      };
  };

  nixpkgs.overlays = [ inputs.niri.overlays.niri ];

  home.packages = with pkgs; [
    xwayland-satellite
    matugen
  ];

  xdg.portal = {
    enable = true;
    config = {
      common = {
        default = [ "gtk" "gnome" ];
      };
      niri = {
        default = [ "gtk" "gnome" ];
      };
    };
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
    xdgOpenUsePortal = true;
  };
}
