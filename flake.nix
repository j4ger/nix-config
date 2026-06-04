{
  description = "nixOS config for my laptop";

  inputs = {
    # nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    daeuniverse = {
      url = "github:daeuniverse/flake.nix";
      #   inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
    };

    j4ger-pkgs = {
      url = "github:j4ger/nix-packages";
      inputs.nixpkgs.follows = "nixpkgs";
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

    swww = {
      url = "github:LGFae/swww";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    yazi = {
      url = "github:sxyazi/yazi";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-alien = {
      url = "github:thiagokokada/nix-alien";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
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

  outputs =
    {
      self,
      nixpkgs,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      myPackages = import ./pkgs {
        pkgs = nixpkgs.legacyPackages.${system};
        inherit inputs system;
      };

      # Shared pkgs configuration matching the NixOS system
      pkgsFor = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        config.permittedInsecurePackages = [
          "openssl-1.1.1w"
        ];
        overlays = [
          (final: prev: {
            nur = import inputs.nur {
              nurpkgs = prev;
              pkgs = prev;
              repoOverrides = {
                j4ger = import inputs.j4ger-pkgs { pkgs = prev; };
              };
            };
          })
          inputs.niri.overlays.niri
        ];
      };
    in
    {
      packages = myPackages;

      formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;

      nixosConfigurations = {
        v04-tx = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit
              inputs
              outputs
              myPackages
              system
              ;
          };
          modules = with inputs; [
            ./nixos/configuration.nix

            catppuccin.nixosModules.catppuccin

            agenix.nixosModules.default

            daeuniverse.nixosModules.dae
            daeuniverse.nixosModules.daed

            lanzaboote.nixosModules.lanzaboote
          ];
        };
      };

      homeConfigurations = {
        j4ger = inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = pkgsFor;
          extraSpecialArgs = {
            inherit inputs outputs myPackages system;
          };
          modules = with inputs; [
            ./home-manager/home.nix
            catppuccin.homeModules.catppuccin
            noctalia.homeModules.default
          ];
        };
      };
    };
}
