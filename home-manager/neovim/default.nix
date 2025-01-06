{
  myPackages,
  system,
  pkgs,
  ...
}: let
  tomlFormat = pkgs.formats.toml {};
in {
  home.packages = [
    myPackages.${system}.mynvim
    pkgs.neovide
  ];

  xdg.configFile."neovide/config.toml" = {
    source = tomlFormat.generate "config.toml" {
      fork = true;
      font = {
        normal = ["monospace"];
        size = 14.0;
      };
    };
  };
}
