{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      # super-slicer.beta
    ];
  };
}