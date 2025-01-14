{ pkgs, inputs, system, ...}: 
let 
  swww_latest = inputs.swww.packages.${system}.swww;
  swww_script = pkgs.writeShellScript "swww_randomize" ''
    export SWWW_TRANSITION_FPS=60
    export SWWW_TRANSITION_STEP=2
    while true; do
      find ~/Pictures/Wallpapers -type f \
        | while read -r img; do
          echo "$((RANDOM % 1000)):$img"
        done \
        | sort -n | cut -d':' -f2- \
        | while read -r img; do
          ${swww_latest}/bin/swww img "$img"
          sleep 300
        done
    done
  '';
in
{
  imports = [
    ./hyprpanel.nix
    ./hyprlock.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    # package = inputs.hyprland.packages.${system}.hyprland;

    plugins = with pkgs; [
      hyprlandPlugins.hyprscroller
    ];

    settings = {
      monitor = [
        "eDP-1, preferred, auto, 1.6"
        ", preferred, auto, 1"
      ];

      general = {
        gaps_out = 10;

        layout = "scroller";
      };

      decoration = {
        rounding = 5;
      };

      master = {
        
      };

      dwindle = {

      };

      animations = {
        enabled = true;

        bezier = [
          "linear, 0, 0, 1, 1"
          "md3_standard, 0.2, 0, 0, 1"
          "md3_decel, 0.05, 0.7, 0.1, 1"
          "md3_accel, 0.3, 0, 0.8, 0.15"
          "overshot, 0.05, 0.9, 0.1, 1.1"
          "crazyshot, 0.1, 1.5, 0.76, 0.92"
          "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
          "menu_decel, 0.1, 1, 0, 1"
          "menu_accel, 0.38, 0.04, 1, 0.07"
          "easeInOutCirc, 0.85, 0, 0.15, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutExpo, 0.16, 1, 0.3, 1"
          "softAcDecel, 0.26, 0.26, 0.15, 1"
          "md2, 0.4, 0, 0.2, 1"
        ];

        animation = [
          "windows, 1, 3, md3_decel, popin 60%"
          "windowsIn, 1, 3, md3_decel, popin 60%"
          "windowsOut, 1, 3, md3_accel, popin 60%"
          "border, 1, 10, default"
          "fade, 1, 3, md3_decel"
          "layers, 1, 2, md3_decel, slide"
          "layersIn, 1, 3, menu_decel, slide"
          "layersOut, 1, 1.6, menu_accel"
          "fadeLayersIn, 1, 2, menu_decel"
          "fadeLayersOut, 1, 4.5, menu_accel"
          "workspaces, 1, 7, menu_decel, slide"
          # animation = workspaces, 1, 2.5, softAcDecel, slide
          # animation = workspaces, 1, 7, menu_decel, slidefade 15%
          # animation = specialWorkspace, 1, 3, md3_decel, slidefadevert 15%
          "specialWorkspace, 1, 3, md3_decel, slidevert"
        ];
      };

      gestures = {
        # disable those due to the use of hyperscroller
        # workspace_swipe = true;
        # workspace_swipe_fingers = 3;
      };

      misc = {
        # vfr = false; # TODO: test this out
      };

      windowrulev2 = [
        "float, tag:modal"
        "center, tag:modal"
        "float, class:(clipse)"
        "size 622 652, class:(clipse)"
      ];

      layerrule = [

      ];

      input = {
        follow_mouse = 1;
        
        touchpad = {
          natural_scroll = true;
          drag_lock = true;
        };
      };

      "$mod" = "Super";

      bind = [
        "$mod, E, exec, ghostty -e yazi"
        "$mod+Shift, Return, exec, ghostty"
        "$mod, R, exec, zen"

        "$mod+Shift, E, exec, wlogout"
        "$mod+Shift, L, exec, hyprlock"

        "$mod, D, exec, rofi -show run"
        "$mod, V, exec, alacritty --class clipse -e clipse"

        "$mod, Q, killactive"
        "$mod, F, fullscreen"
        "$mod, T, togglefloating"
        "$mod, P, pin"

        "$mod, H, movefocus, l"
        "$mod, J, movefocus, d"
        "$mod, K, movefocus, u"
        "$mod, L, movefocus, r"

        "$mod, G, togglegroup"
        "$mod, Tab, changegroupactive, f"
        "$mod+Shift, Tab, changegroupactive, b"
        
        "Alt, Tab, cyclenext"
        "Alt+Shift, Tab, cyclenext, prev"

        "$mod, U, focusurgentorlast"

        "$mod+Shift, S, exec, grimblast --freeze copy area"
        "$mod+Ctrl, S, exec, grimblast --freeze save screen"

        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"

        "$mod, A, scroller:toggleoverview"
        "$mod, W, scroller:jump"
        "$mod+Shift, H, scroller:movewindow, l"
        "$mod+Shift, L, scroller:movewindow, r"
        "$mod, M, scroller:alignwindow, c"
        "$mod, P, scroller:admitwindow"
        "$mod, O, scroller:expelwindow"
        "$mod, C, scroller:fitsize, active"
        "$mod+Shift, K, scroller:cyclesize, +1"
        "$mod+Shift, J, scroller:cyclesize, -1"
      ]++(
        builtins.concatLists (
          builtins.genList (i:
            let index = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString index}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString index}"
            ]
          ) 9
        )
      );

      bindl = [
        ", XF86AudioMute, exec, pamixer -m"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      bindel = [
        ", XF86AudioLowerVolume, exec, pamixer -d 5"
        ", XF86AudioRaiseVolume, exec, pamixer -i 5"
        ", XF86MonBrightnessUp, exec, light -A 5"
        ", XF86MonBrightnessDown, exec, light -N 0.1 && light -U 5"
      ];

      binde = [
        "$mod+Ctrl, H, resizeactive, -30 0"
        "$mod+Ctrl, J, resizeactive, 0 30"
        "$mod+Ctrl, K, resizeactive, 0 -30"
        "$mod+Ctrl, L, resizeactive, 30 0"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      env = [
        "HYPRCURSOR_THEME,Bibata-Modern-Ice"
        "HYPRCURSOR_SIZE,24"
        "AQ_DRM_DEVICES,/dev/dri/card1"
      ];

      debug = {
        disable_logs = false;
      };

      exec-once = [
        "nm-applet"
        "fcitx5"
        "clipse -listen"
        "kdeconnectd"
        "swww-daemon"
        "${swww_script}"
      ];
    };

  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  home.packages = with pkgs; [
    wayland
    egl-wayland
    xwayland

    polkit_gnome
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk

    hyprutils
    # mako

    nwg-look
    swww_latest

    wlogout

    playerctl
    
    pamixer
    clipse
    grimblast
    networkmanagerapplet

    bibata-cursors
  ];

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    cycle = true;
    terminal = "alacritty";
    plugins = with pkgs; [
    ];
  };

  catppuccin.flavor = "macchiato";
  catppuccin.enable = true;

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        ignore_dbus_inhibit = false;
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = 150;
          on-timeout = "brightnessctl -s set 10";
          on-resume = "brightnessctl -r";
        }
        {
          timeout = 300;
          on-timeout = "pidof hyprlock || hyprlock";
        }
        {
          timeout = 900;
          on-timeout = "systemctl suspend-then-hibernate";
        }
      ];
    };
  };
}
