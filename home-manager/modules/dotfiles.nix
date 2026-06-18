{ lib, ... }:

with lib;

{
  options.dotfiles = {
    mutable = mkEnableOption "mutable dotfiles (symlinks instead of Nix store links)";
    path = mkOption {
      type = types.path;
      default = "/home/j4ger/nix-config";
      description = "Path to the nix-config repository";
    };
  };
}