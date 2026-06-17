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

    daeuniverse = {
      url = "github:daeuniverse/flake.nix";
      #   inputs.nixpkgs.follows = "nixpkgs";
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

  outputs =
    {
      self,
      nixpkgs,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";

      # Shared pkgs configuration matching the NixOS system
      pkgsFor = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        config.permittedInsecurePackages = [
          "openssl-1.1.1w"
        ];
        overlays = [
          inputs.niri.overlays.niri
        ];
      };
    in
    {

      formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;

      nixosConfigurations = {
        v04-tx = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit
              inputs
              outputs
              system
              ;
          };
          modules = with inputs; [
            ./nixos/configuration.nix

            catppuccin.nixosModules.catppuccin

            daeuniverse.nixosModules.dae
            daeuniverse.nixosModules.daed

            lanzaboote.nixosModules.lanzaboote

            noctalia-greeter.nixosModules.default
          ];
        };
      };

      homeConfigurations = {
        j4ger = inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = pkgsFor;
          extraSpecialArgs = {
            inherit inputs outputs system;
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
