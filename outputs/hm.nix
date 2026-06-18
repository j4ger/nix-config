{ inputs, system, lib, pkgsFor, ... }:

inputs.home-manager.lib.homeManagerConfiguration {
  pkgs = pkgsFor;
  extraSpecialArgs = {
    inherit inputs system;
  };
  modules = [
    ../home-manager/home.nix
    inputs.catppuccin.homeModules.catppuccin
    inputs.noctalia.homeModules.default
  ];
}
