# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  myPackages,
  system,
  ...
}:
{
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    # outputs.nixosModules.example

    # Or modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # home-manager
    inputs.home-manager.nixosModules.home-manager

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
    ./hardware-common.nix

    ./system-packages.nix

    ./desktop.nix
    ./fonts.nix
    ./networking.nix
    ./secrets.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # nur
      (final: prev: {
        nur = import inputs.nur {
          nurpkgs = prev;
          pkgs = prev;
          repoOverrides = {
            j4ger = import inputs.j4ger-pkgs { pkgs = prev; };
          };
        };
      })

      #inputs.hyprpanel.overlay
    ];
    # Configure your nixpkgs instance
    config = {
      # FIXME: somehow this is ignored by home-manager
      allowUnfree = true;

      # FIXME: wechat-uos still depends on this
      permittedInsecurePackages = [
        "openssl-1.1.1w"
      ];
    };
  };

  nix =
    let
      flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
    in
    {
      settings = {
        # Enable flakes and new 'nix' command
        experimental-features = "nix-command flakes";
        # Opinionated: disable global registry
        flake-registry = "";
        # Workaround for https://github.com/NixOS/nix/issues/9574
        nix-path = config.nix.nixPath;
        substituters = [
          "https://mirrors.ustc.edu.cn/nix-channels/store"
          "https://cache.nixos.org/"
          "https://yazi.cachix.org"
          "https://hyprland.cachix.org"
          "https://nix-community.cachix.org"
          "https://devenv.cachix.org"
          "https://cosmic.cachix.org/"
        ];
        trusted-public-keys = [
          "yazi.cachix.org-1:Dcdz63NZKfvUCbDGngQDAZq6kOroIrFoyO064uvLh8k="
          "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
          "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
        ];
        trusted-users = [
          "root"
          "j4ger"
        ];
      };
      # Opinionated: disable channels
      channel.enable = false;

      # Opinionated: make flake registry and nix path match flake inputs
      registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
      nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;

      gc = {
        automatic = false; # Disable due to nh
        dates = "weekly";
        options = "--delete-older-than 2d";
      };
      extraOptions = ''
        !include ${config.age.secrets.nix-extra-options.path}
      '';
    };

  # FIXME: Add the rest of your current configuration

  # TODO: Set your hostname
  networking.hostName = "v04-tx";

  time.timeZone = "Asia/Shanghai";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ALL = "en_US.UTF-8";
      LANGUAGE = "en_US.UTF-8";
    };
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "C.UTF-8/UTF-8"
      "zh_CN.UTF-8/UTF-8"
      "zh_TW.UTF-8/UTF-8"
    ];
  };

  # TODO: Configure your system-wide user settings (groups, etc), add more users as needed.
  users.users = {
    # FIXME: Replace with your username
    j4ger = {
      # TODO: You can set an initial password for your user.
      # If you do, you can skip setting a root password by passing '--no-root-passwd' to nixos-install.
      # Be sure to change it (using passwd) after rebooting!
      initialPassword = "iamthestorm";
      isNormalUser = true;
      # TODO: Be sure to add any other groups you need (such as networkmanager, audio, docker, etc)
      extraGroups = [
        "wheel"
        "video"
        "audio"
        "NetworkManager"
        "libvirtd"
        "plugdev"
        "ydotool"
        "input"
        "kvm"
        "adbusers"
        "docker"
        "dialout"
      ];
      shell = pkgs.fish;
    };
  };

  # home-manager
  home-manager = {
    extraSpecialArgs = {
      inherit
        inputs
        outputs
        myPackages
        system
        ;
    };
    users = {
      # Import your home-manager configuration
      j4ger = import ../home-manager/home.nix;
    };
    useUserPackages = true;
    useGlobalPkgs = true;
  };

  security.polkit.enable = true;
  security.sudo.enable = true;
  security.rtkit.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.11";
}
