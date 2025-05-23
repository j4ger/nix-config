{
  pkgs,
  inputs,
  system,
  ...
}: {
  home.packages = with pkgs; [
    libnotify
    fd
    bat
    ripgrep
    micro
    dust
    qrcp
    termscp
    proxychains-ng
    distrobox
    qimgv
    unzrip
    nil
    nixd
    aichat
    poppler-utils
    ueberzugpp
    uv
    inputs.nix-alien.packages.${system}.default
  ];
  programs = {
    rio = {
      enable = false;
      settings = {
        editor = {
          program = "zeditor";
        };
        cursor = {
          shape = "beam";
        };
        fonts = {
          size = 16;
          family = "Maple Mono Normal NF CN";
        };
        renderer = {
          performance = "Low";
        };
        window = {
          opacity = 0.6;
          blur = true;
        };
      };
    };
    yazi = {
      enable = true;
      # package = inputs.yazi.packages.${system}.default;
      enableFishIntegration = true;
    };
    alacritty = {
      enable = true;
      settings = {
        bell.duration = 500;

        bell.command = {
          args = ["Shell bell rang!"];
          program = "notify-send";
        };

        cursor.style = {
          blinking = "On";
          shape = "Beam";
        };

        font = {
          size = 14.0;
        };

        colors.primary = {
          background = "#1a1b26";
          foreground = "#a9b1d6";
        };

        colors.normal = {
          black = "#32344a";
          red = "#f7768e";
          green = "#9ece6a";
          yellow = "#e0af68";
          blue = "#7aa2f7";
          magenta = "#ad8ee6";
          cyan = "#449dab";
          white = "#787c99";
        };

        colors.bright = {
          black = "#444b6a";
          red = "#ff7a93";
          green = "#b9f27c";
          yellow = "#ff9e64";
          blue = "#7da6ff";
          magenta = "#bb9af7";
          cyan = "#0db9d7";
          white = "#acb0d0";
        };

        selection.save_to_clipboard = false;

        window = {
          dynamic_padding = true;
          opacity = 0.8;
        };

        window.padding = {
          x = 0;
          y = 0;
        };
      };
    };
    wezterm = {
      enable = true;
      extraConfig = ''
        local wezterm = require('wezterm');
        local config = wezterm.config_builder();

        config.font = wezterm.font("Maple Mono Normal NF CN");
        config.font_size = 12.0;
        config.window_background_opacity = 0.7;
        config.enable_tab_bar = false;
        config.color_scheme = "tokyonight_night"
        config.text_background_opacity = 0.8;
        config.window_decorations = "NONE";

        return config
      '';
    };
    fish = {
      enable = true;
      interactiveShellInit = ''set fish_greeting ""'';
      shellAliases = {
        l = "ls -ahl";
        la = "eza -a --icons";
        ll = "eza -l --icons";
        ls = "eza";
        top = "btop";
        lg = "lazygit";
        v = "neovide";
        nhus = "nh os switch . --update -- --show-trace";
        nhs = "nh os switch . -- --show-trace";
        ze = "zeditor .";
        plz = "aichat -e";
      };
    };
    starship = {
      enable = true;
      enableFishIntegration = true;
    };
    eza.enable = true;
    helix.enable = true;
    atuin = {
      enable = true;
      enableFishIntegration = true;
    };
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    git = {
      enable = true;
      userName = "j4ger";
      userEmail = "xiayuxuan@live.com";
      signing = {
        key = "A645FE4CA59374C8";
        signByDefault = true;
      };
      extraConfig = {
        url = {
          "ssh://git@github.com:j4ger" = {
            insteadOf = "https://github.com/j4ger/";
          };
        };
      };
    };
    ssh = {
      enable = true;
      extraConfig = ''
        Host github.com
        Hostname ssh.github.com
        Port 443
        User git
      '';
    };
    lazygit.enable = true;
    yt-dlp.enable = true;
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
    nix-index.enable = true;
    btop.enable = true;
    fzf = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
