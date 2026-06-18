{ lib, ... }:
{
  imports = [
    ./hidpi.nix
    ./software.nix
    ./dotfiles.nix
    ./secrets.nix
  ];
}