{ pkgs, ... }:
{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wezterm = require('wezterm');
      local config = wezterm.config_builder();

      config.font = wezterm.font("Maple Mono Normal NF CN");
      config.font_size = 12;
      config.window_background_opacity = 0.7;
      config.enable_tab_bar = false;
      config.color_scheme = "tokyonight_night"
      config.text_background_opacity = 0.8;
      config.window_decorations = "NONE";

      return config
    '';
  };
}
