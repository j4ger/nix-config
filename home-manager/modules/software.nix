{ lib, ... }:

with lib;

{
  options.software = {
    creative = mkEnableOption "creative software (blender, gimp3, kdenlive, etc.)";
    gaming = mkEnableOption "gaming software (steam, prismlauncher, etc.)";
    development = mkEnableOption "development tools (gcc, clang, docker, etc.)";
    multimedia = mkEnableOption "multimedia software (mpv, obs, etc.)";
  };
}