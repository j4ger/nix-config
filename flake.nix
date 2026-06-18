{
  description = "nixOS config for my laptop";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    daeuniverse = {
      url = "github:daeuniverse/flake.nix";
    };

    rime-wanxiang = {
      url = "github:amzxyz/rime-wanxiang?ref=wanxiang-zrm-fuzhu";
      flake = false;
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    picopi = {
      url = "github:j4ger/picopi";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      
      # Import lib functions
      lib = import ./lib { inherit inputs system; lib = nixpkgs.lib; };
      
      # Shared pkgs configuration matching the NixOS system
      pkgsFor = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        config.permittedInsecurePackages = [
          "openssl-1.1.1w"
        ];
        overlays = import ./lib/overlays.nix { inherit inputs system; };
      };
    in
    {
      formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;

      nixosConfigurations = {
        v04-tx = import ./outputs/os.nix {
          inherit inputs system;
          lib = nixpkgs.lib;
        };
      };

      homeConfigurations = {
        j4ger = import ./outputs/hm.nix {
          inherit inputs system pkgsFor;
          lib = nixpkgs.lib;
        };
      };
    };
}
