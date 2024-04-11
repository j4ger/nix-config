{ pkgs, inputs, self, lib, ... }:
{
  nix = {
    channel.enable = false;
    settings = {
      nix-path = lib.mkForce "nixpkgs=flake:nixpkgs";
      experimental-features = [ "nix-command" "flakes" "auto-allocate-uids" "configurable-impure-env" "cgroups" ];
      auto-allocate-uids = true;
      use-cgroups = true;
      auto-optimise-store = true; # Optimise syslinks
      accept-flake-config = true;
      builders-use-substitutes = true;
      keep-derivations = true;
      keep-outputs = true;
      substituters = [
        "https://mirror.sjtu.edu.cn/nix-channels/store"
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      trusted-users = [ "root" "@wheel" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 2d";
    };
    package = pkgs.nixVersions.unstable;
    registry.nixpkgs.flake = inputs.nixpkgs;
    extraOptions = ''
      keep-outputs            = true
      keep-derivations        = true
    '';
  };

  nixpkgs = {
    config = {
      allowBroken = true;
      # allowUnsupportedSystem = true;
      allowUnfree = true;
    };
    overlays = [
      self.overlays.default
      inputs.rust-overlay.overlays.default
    ];
  };
}
