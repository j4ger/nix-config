{ inputs, ... }:
{
  imports = [
    inputs.catppuccin.homeModules.catppuccin
    inputs.noctalia.homeModules.default

    ./browser
    ./hyprland
    ./ime
    ./misc.nix
    ./neovim
    ./niri
    ./terminal.nix
    ./gestures.nix
  ];

  home = {
    username = "j4ger";
    homeDirectory = "/home/j4ger";
  };

  programs.home-manager.enable = true;
  programs.git.enable = true;

  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.11";
}
