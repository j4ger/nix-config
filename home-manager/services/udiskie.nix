{ pkgs, ... }:
{
  services.udiskie = {
    enable = true;
    settings = {
      program_options = {
        file_manager = "${pkgs.alacritty}/bin/alacritty -e ${pkgs.yazi}/bin/yazi";
      };
    };
  };
}
