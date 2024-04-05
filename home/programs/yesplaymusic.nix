{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      yesplaymusic
    ];
  };
}
