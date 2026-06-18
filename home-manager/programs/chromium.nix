{ pkgs, ... }:
{
  programs.chromium = {
    enable = true;
    commandLineArgs = [ "--enable-wayland-ime" ];
  };
}
