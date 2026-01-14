{
  inputs,
  config,
  pkgs,
  lib,
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
      let
        ns = panel: actionName: {
          spawn = [
            "noctalia-shell"
            "ipc"
            "call"
            panel
            actionName
          ];
        };
      in
      with config.lib.niri.actions;
      {
        binds = {
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
          "Mod+Shift+R".action = ns "screenRecorder" "toggle";

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

          # Noctalia IPC
          "Mod+D".action = ns "launcher" "toggle";
          "Mod+C".action = ns "controlCenter" "toggle";
          "Mod+P".action = ns "powerPanel" "toggle";
          "Mod+Shift+E".action = ns "sessionMenu" "toggle";
          "Mod+Alt+E".action = ns "lockScreen" "toggle";
          "Mod+Ctrl+E".action = ns "idleInhibitor" "toggle";
          "Mod+V".action = ns "launcher" "clipboard";
          "Mod+Shift+D".action = ns "launcher" "calculator";
          "Mod+N".action = ns "notifications" "toggleHistory";
          "Mod+Shift+N".action = ns "notifications" "toggleDND";
          "Mod+Ctrl+N".action = ns "notifications" "dismissOldest";
          "Mod+Alt+N".action = ns "notifications" "clear";

          # Media / brightness
          "XF86AudioRaiseVolume".action = ns "volume" "increase";
          "XF86AudioLowerVolume".action = ns "volume" "decrease";
          "XF86AudioMute".action = ns "volume" "muteOutput";
          "XF86MonBrightnessUp".action = ns "brightness" "increase";
          "XF86MonBrightnessDown".action = ns "brightness" "decrease";
        };

        "screenshot-path" = "~/Pictures/Screenshots/Screenshot-%Y%m%d-%H%M%S.png";

        "hotkey-overlay" = {
          "skip-at-startup" = true;
        };

        "prefer-no-csd" = true;

        "spawn-at-startup" = [
          { argv = [ "noctalia-shell" ]; }
        ];

        environment = {
          NIXOS_OZONE_WL = "1";
          QT_QPA_PLATFORM = "wayland";
        };

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
          mouse = {
            "scroll-method" = "on-button-down";
            "scroll-button" = 276;
            "scroll-button-lock" = true;
          };
        };

        outputs = {
          "eDP-1" = {
            position = {
              x = 2048;
              y = 0;
            };
            scale = 1.5;
            "variable-refresh-rate" = true;
          };
          "DP-1" = {
            position = {
              x = 0;
              y = 0;
            };
            scale = 1.25;
            "focus-at-startup" = true;
          };
          "DP-2" = {
            position = {
              x = 0;
              y = 0;
            };
            scale = 1.25;
            "focus-at-startup" = true;
          };
          "DP-3" = {
            position = {
              x = 0;
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

  # xdg.portal = {
  #   enable = true;
  #   xdgOpenUsePortal = true;
  #   extraPortals = [
  #     pkgs.xdg-desktop-portal-gtk
  #     pkgs.xdg-desktop-portal-wlr
  #   ];
  # };

  nixpkgs.overlays = [ inputs.niri.overlays.niri ];

  home.packages = with pkgs; [
    xwayland-satellite
    matugen
  ];
}
