{
  description = "nixOS config for my laptop";

  inputs = {
    # nixpkgs (default to unstable)
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # home manager for dotfiles & programs
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # lanzaboote
    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # agenix for secrets encryption
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # dae for networking
    daeuniverse = {
      url = "github:daeuniverse/flake.nix";
      #   inputs.nixpkgs.follows = "nixpkgs";
    };

    # nur for few newer packages
    nur = {
      url = "github:nix-community/NUR";
    };

    # my packages
    j4ger-pkgs = {
      url = "github:j4ger/nix-packages";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nixvim
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # arc-wtf
    arcwtf = {
      url = "github:KiKaraage/ArcWTF";
      flake = false;
    };

    # rustaceanvim
    rustaceanvim = {
      url = "github:mrcjkb/rustaceanvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:ch4og/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    inherit (self) outputs;
    # Supported systems for your flake packages, shell, etc.
    system = "x86_64-linux";
    # This is a function that generates an attribute by calling a function you
    # pass to it, with each system as an argument
    # forAllSystems = nixpkgs.lib.genAttrs systems;
    myPackages = import ./pkgs {
      pkgs = nixpkgs.legacyPackages.${system};
      inherit inputs system;
    };
  in {
    # Your custom packages
    # Accessible through 'nix build', 'nix shell', etc
    packages = myPackages;
    # Formatter for your nix files, available through 'nix fmt'
    # Other options beside 'alejandra' include 'nixpkgs-fmt'
    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;

    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      # FIXME replace with your hostname
      v04-tx = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs myPackages system;
        };
        modules = [
          # > Our main nixos configuration file <
          ./nixos/configuration.nix
          inputs.agenix.nixosModules.default
          inputs.daeuniverse.nixosModules.dae
          inputs.daeuniverse.nixosModules.daed

          inputs.lanzaboote.nixosModules.lanzaboote
        ];
      };
    };
  };
}
