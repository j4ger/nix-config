{ inputs, withSystem, module_args, ... }:
let
  user = "j4ger";

  sharedModules = [
    (import ../. { inherit user; })
    module_args
    # inputs.hyprland.homeManagerModules.default
    inputs.nix-index-database.hmModules.nix-index
    inputs.nur.hmModules.nur
  ];

  homeImports = {
    "${user}@v04-x13" = [ ./k-on ] ++ sharedModules;
  };

  inherit (inputs.home-manager.lib) homeManagerConfiguration;
in
{
  imports = [
    # we need to pass this to NixOS' HM module
    { _module.args = { inherit homeImports user; }; }
  ];

  flake = {
    homeConfigurations = withSystem "x86_64-linux" ({ pkgs, ... }: {
      "${user}@v04-x13" = homeManagerConfiguration {
        modules = homeImports."${user}@v04-x13";
        inherit pkgs;
      };
    });
  };
}
