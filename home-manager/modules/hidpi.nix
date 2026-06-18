{ lib, ... }:

with lib;

{
  options.hidpi = mkEnableOption "HiDPI display support";
  
  # Example: programs can check config.hidpi to adjust font sizes
  # config.programs.alacritty.settings.font.size = mkIf config.hidpi 14;
}