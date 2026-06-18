{ inputs, system, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../hardware-common.nix
    ../../desktop/niri.nix
  ];

  # Host-specific settings
  networking.hostName = "v04-tx";
  
  # Boot configuration
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  # Host-specific kernel parameters
  boot.kernelParams = [ ];
}