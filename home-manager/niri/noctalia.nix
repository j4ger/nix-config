{
  inputs,
  system,
  ...
}:
{
  home.packages = [
    inputs.noctalia.packages.${system}.default
  ];

  home.sessionVariables = {
    QS_ICON_THEME = "Vimix";
  };

  programs.noctalia-shell = {
    enable = true;
    settings = {
      appLauncher = {
        backgroundOpacity = 0.75;
        enableClipboardHistory = true;
        pinnedExecs = [ ];
        position = "center";
        sortByMostUsed = true;
        terminalCommand = "alacritty -e";
        useApp2Unit = false;
      };

      audio = {
        cavaFrameRate = 60;
        mprisBlacklist = [ ];
        preferredPlayer = "";
        visualizerType = "linear";
        volumeOverdrive = false;
        volumeStep = 5;
      };

      bar = {
        backgroundOpacity = 1;
        density = "default";
        floating = false;
        marginHorizontal = 0.25;
        marginVertical = 0.25;
        monitors = [ ];
        position = "right";
        showCapsule = false;
        widgets = {
          center = [
            {
              hideUnoccupied = false;
              id = "Workspace";
              labelMode = "index";
            }
          ];
          left = [
            {
              hideMode = "hidden";
              id = "MediaMini";
              maxWidth = 145;
              scrollingMode = "hover";
              showAlbumArt = false;
              showVisualizer = false;
              useFixedWidth = false;
              visualizerType = "linear";
            }
            {
              displayMode = "alwaysShow";
              id = "Volume";
            }
            {
              id = "SystemMonitor";
              showCpuTemp = true;
              showCpuUsage = true;
              showDiskUsage = false;
              showMemoryAsPercent = true;
              showMemoryUsage = true;
              showNetworkStats = false;
            }
            {
              colorizeIcons = true;
              hideMode = "hidden";
              id = "Taskbar";
              onlyActiveWorkspaces = false;
              onlySameOutput = true;
            }
            {
              colorizeIcons = false;
              hideMode = "hidden";
              id = "ActiveWindow";
              maxWidth = 145;
              scrollingMode = "hover";
              showIcon = false;
              useFixedWidth = false;
            }
          ];
          right = [
            {
              blacklist = [
                "fcitx"
                "udiskie"
              ];
              colorizeIcons = true;
              id = "Tray";
            }
            {
              displayMode = "alwaysShow";
              id = "Battery";
              warningThreshold = 20;
            }
            {
              displayMode = "onhover";
              id = "Brightness";
            }
            {
              id = "WiFi";
            }
            {
              id = "Bluetooth";
            }
            {
              customFont = "";
              formatHorizontal = "HH:mm ddd, MMM dd";
              formatVertical = "HH mm ss";
              id = "Clock";
              useCustomFont = false;
              usePrimaryColor = true;
            }
            {
              hideWhenZero = false;
              id = "NotificationHistory";
              showUnreadBadge = true;
            }
            {
              customIconPath = "";
              icon = "brand-snowflake";
              id = "ControlCenter";
              useDistroLogo = false;
            }
          ];
        };
      };

      battery = {
        chargingMode = 0;
      };

      brightness = {
        brightnessStep = 5;
      };

      colorSchemes = {
        darkMode = true;
        generateTemplatesForPredefined = true;
        manualSunrise = "06:30";
        manualSunset = "18:30";
        matugenSchemeType = "scheme-rainbow";
        predefinedScheme = "Noctalia (default)";
        schedulingMode = "off";
        useWallpaperColors = true;
      };

      controlCenter = {
        cards = [
          {
            enabled = true;
            id = "profile-card";
          }
          {
            enabled = true;
            id = "shortcuts-card";
          }
          {
            enabled = true;
            id = "audio-card";
          }
          {
            enabled = true;
            id = "weather-card";
          }
          {
            enabled = true;
            id = "media-sysmon-card";
          }
        ];
        position = "close_to_bar_button";
        shortcuts = {
          left = [
            {
              id = "WiFi";
            }
            {
              id = "Bluetooth";
            }
            {
              id = "ScreenRecorder";
            }
            {
              id = "WallpaperSelector";
            }
          ];
          right = [
            {
              id = "Notifications";
            }
            {
              id = "PowerProfile";
            }
            {
              id = "KeepAwake";
            }
            {
              id = "NightLight";
            }
          ];
        };
      };

      dock = {
        enabled = false;
        backgroundOpacity = 1;
        colorizeIcons = false;
        displayMode = "always_visible";
        floatingRatio = 1;
        monitors = [ ];
        onlySameOutput = true;
        pinnedApps = [ ];
        size = 1;
      };

      general = {
        animationDisabled = false;
        animationSpeed = 1;
        avatarImage = "/home/j4ger/.face.icon";
        compactLockScreen = false;
        dimDesktop = false;
        forceBlackScreenCorners = true;
        language = "";
        lockOnSuspend = true;
        radiusRatio = 0.5;
        scaleRatio = 1;
        screenRadiusRatio = 0.5;
        showScreenCorners = true;
      };

      hooks = {
        darkModeChange = "";
        enabled = false;
        wallpaperChange = "";
      };

      location = {
        name = "Shenzhen, China";
        showWeekNumberInCalendar = false;
        use12hourFormat = false;
        useFahrenheit = false;
        weatherEnabled = true;
      };

      network = {
        wifiEnabled = true;
      };

      nightLight = {
        autoSchedule = true;
        dayTemp = "6500";
        enabled = true;
        forced = false;
        manualSunrise = "06:30";
        manualSunset = "18:30";
        nightTemp = "5000";
      };

      notifications = {
        alwaysOnTop = false;
        criticalUrgencyDuration = 15;
        doNotDisturb = false;
        lastSeenTs = 0;
        location = "top_right";
        lowUrgencyDuration = 3;
        monitors = [ ];
        normalUrgencyDuration = 8;
        respectExpireTimeout = false;
      };

      osd = {
        alwaysOnTop = false;
        autoHideMs = 2000;
        enabled = true;
        location = "top_right";
        monitors = [ ];
      };

      screenRecorder = {
        audioCodec = "opus";
        audioSource = "default_output";
        colorRange = "limited";
        directory = "";
        frameRate = 60;
        quality = "very_high";
        showCursor = true;
        videoCodec = "h264";
        videoSource = "portal";
      };

      settingsVersion = 16;
      setupCompleted = true;

      templates = {
        discord = false;
        discord_armcord = false;
        discord_dorion = false;
        discord_equibop = false;
        discord_lightcord = false;
        discord_vesktop = false;
        discord_webcord = false;
        enableUserTemplates = false;
        foot = false;
        fuzzel = false;
        ghostty = false;
        gtk = true;
        kcolorscheme = true;
        kitty = false;
        pywalfox = false;
        qt = true;
      };

      ui = {
        fontDefault = "Noto Sans CJK SC";
        fontDefaultScale = 1;
        fontFixed = "FiraCode Nerd Font Mono";
        fontFixedScale = 1;
        tooltipsEnabled = true;
      };

      wallpaper = {
        defaultWallpaper = "";
        directory = "/home/j4ger/Pictures/Wallpapers";
        enableMultiMonitorDirectories = false;
        enabled = true;
        fillColor = "#000000";
        fillMode = "crop";
        monitors = [
          {
            directory = "/home/j4ger/Pictures/Wallpapers";
            name = "eDP-1";
            wallpaper = "/home/j4ger/Pictures/Wallpapers/island-3.png";
          }
          {
            directory = "/home/j4ger/Pictures/Wallpapers";
            name = "DP-2";
            wallpaper = "/home/j4ger/Pictures/Wallpapers/island-3.png";
          }
        ];
        randomEnabled = true;
        randomIntervalSec = 900;
        setWallpaperOnAllMonitors = true;
        transitionDuration = 1500;
        transitionEdgeSmoothness = 0.05;
        transitionType = "random";
      };
    };
  };
}
