{ lib, ... }:
let
  entries = builtins.readDir ./.;
  
  # Import .nix files directly (excluding default.nix)
  nixFiles = lib.pipe entries [
    (lib.filterAttrs (name: type: 
      type == "regular" && 
      lib.hasSuffix ".nix" name && 
      name != "default.nix"
    ))
    (lib.mapAttrsToList (name: _: ./. + "/${name}"))
  ];
  
  # Import directories that have a default.nix
  dirs = lib.pipe entries [
    (lib.filterAttrs (name: type: 
      type == "directory" && 
      builtins.pathExists (./. + "/${name}/default.nix")
    ))
    (lib.mapAttrsToList (name: _: ./. + "/${name}"))
  ];
  
  imports = nixFiles ++ dirs;
in
{
  inherit imports;
}
