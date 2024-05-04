{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      kdePackages.kdenlive
      glaxnimate
      gimp-with-plugins
    ];
  };
}

