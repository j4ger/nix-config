{ pkgs, inputs, system, ... }:
{
  home.packages = [
    inputs.picopi.packages.${system}.default
  ];
}
