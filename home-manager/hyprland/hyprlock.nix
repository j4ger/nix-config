{...}: {
  programs.hyprlock = {
    enable = true;

    settings = {
      background = [
        {
          path = "screenshot";
          blur_passes = 3;
          blue_size = 10;
          brightness = 1.0;
          contrast = 1.0;
          noise = 0.02;
        }
      ];

      input-field = {
        monitor = "";
        size = "250, 50";
        outline_thickness = 0;
        dots_size = 0.26;
        inner_color = "#8aadf4";
        dots_spacing = 0.64;
        dots_center = true;
        fade_on_empty = true;
        placeholder_text = "<i>Password...</i>";
        hide_input = false;
        check_color = "rgb(40, 200, 250)";
        position = "0, 50";
        halign = "center";
        valign = "center";
      };
    };

    extraConfig = ''
        label {
            monitor =
            text = cmd[update:1000] echo "<b><big> $(date +"%H:%M") </big></b>"
            color = "#24273a";

            font_size = 80
            font_family = Maple Mono Normal NF CN 10

            position = 0, -70
            halign = center
            valign = top
        }

        label {
            monitor =
            text = cmd[update:18000000] echo "<b> "$(date +'%A, %-d %B %Y')" </b>"
            color = "#24273a";

            font_size = 24
            font_family = Maple Mono Normal NF CN 10

            position = 0, -200
            halign = center
            valign = top
        }
        '';
  };
}
