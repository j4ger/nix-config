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
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${system}.hyprland;

    settings = {
      monitor = [",preferred,auto,auto"];

      general = {

      };

      decoration = {

      };

      master = {
        
      };

      dwindle = {

      };

      gestures = {
        
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
        
        touchpad = {};
      };

      "$mod" = "Super";

      bind = [
        "$mod, E, exec, dolphin"
        "$mod+Shift, Enter, exec, alacritty"
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
        ", XF86AudioMute, exec, pw-volume mute"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      bindel = [
        ", XF86AudioLowerVolume, exec, pw-volume change -2%"
        ", XF86AudioRaiseVolume, exec, pw-volume change +2%"
        ", XF86MonBrightnessUp, exec, brightnessctl s +5%"
        ", XF86MonBrightnessDown, exec, brightnessctl s -5%"
      ];

      binde = [
        "$mod+Ctrl, H, resizeactive, -30 0"
        "$mod+Ctrl, J, resizeactive, 0 30"
        "$mod+Ctrl, K, resizeactive, 0 -30"
        "$mod+Ctrl, L, resizeactive, 30 0"
      ];

      bindm = [
        "$mod,mouse:272, movewindow"
        "$mod,R, resizewindow"
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
        "clipse -listen"
        "${swww_latest}/bin/swww-daemon"
        "${swww_script}"
      ];
    };

  };

  home.packages = with pkgs; [
    wayland
    egl-wayland
    xwayland

    polkit_gnome
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk

    hyprcursor
    hyprutils
    # mako

    nwg-look

    wlogout

    playerctl
    brightnessctl
    pw-volume
    clipse

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

  programs.hyprlock = {
    enable = true;
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
