{ lib, inputs, system, ... }:

let
  # Helper to get the main executable path of a package
  # Usage: exe pkgs "alacritty" -> "${pkgs.alacritty}/bin/alacritty"
  exe = pkg: name: "${pkg.${name}}/bin/${name}";
  
  # Auto-import helper for directories with mixed .nix files and subdirectories
  # Supports both:
  #   - program.nix (simple single-file programs)
  #   - program/default.nix (complex programs with config files)
  autoImport = dir:
    let
      entries = builtins.readDir dir;
      
      # Import .nix files directly (excluding default.nix)
      nixFiles = lib.pipe entries [
        (lib.filterAttrs (name: type: 
          type == "regular" && 
          lib.hasSuffix ".nix" name && 
          name != "default.nix"
        ))
        (lib.mapAttrsToList (name: _: dir + "/${name}"))
      ];
      
      # Import directories that have a default.nix
      dirs = lib.pipe entries [
        (lib.filterAttrs (name: type: 
          type == "directory" && 
          builtins.pathExists (dir + "/${name}/default.nix")
        ))
        (lib.mapAttrsToList (name: _: dir + "/${name}"))
      ];
    in
    nixFiles ++ dirs;
in
{
  inherit exe autoImport;
}
