{
  pkgs,
  inputs,
  ...
}:
inputs.nixvim.legacyPackages.${pkgs.system}.makeNixvimWithModule {
  inherit pkgs;
  extraSpecialArgs = {
    inherit inputs;
    system = pkgs.system;
  };
  module = {
    imports = [./config.nix];
  };
}
