{ pkgs, ... }:
{
  home.sessionVariables.TERMINAL = "alacritty";
  home.packages = with pkgs; [
    libnotify
  ];
  programs = {
    alacritty = {
      enable = true;
      settings = {
        bell.duration = 500;

        bell.command = {
          args = [ "Shell bell rang!" ];
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
          black   = "#32344a";
          red     = "#f7768e";
          green   = "#9ece6a";
          yellow  = "#e0af68";
          blue    = "#7aa2f7";
          magenta = "#ad8ee6";
          cyan    = "#449dab";
          white   = "#787c99";
        };

        colors.bright = {
          black   = "#444b6a";
          red     = "#ff7a93";
          green   = "#b9f27c";
          yellow  = "#ff9e64";
          blue    = "#7da6ff";
          magenta = "#bb9af7";
          cyan    = "#0db9d7";
          white   = "#acb0d0";
        };

        selection.save_to_clipboard = false;

        window = {
          dynamic_padding = true;
          opacity = 0.7;
        };

        window.padding = {
          x = 0;
          y = 0;
        };
      };
    };
  };
}
