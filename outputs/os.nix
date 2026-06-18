{ inputs, system, lib, ... }:

lib.nixosSystem {
  specialArgs = {
    inherit inputs system;
  };
  modules = [
    ../system/host/v04-tx/default.nix
    ../nixos/configuration.nix
    inputs.catppuccin.nixosModules.catppuccin
    inputs.daeuniverse.nixosModules.dae
    inputs.daeuniverse.nixosModules.daed
    inputs.lanzaboote.nixosModules.lanzaboote
    inputs.noctalia-greeter.nixosModules.default
  ];
}
