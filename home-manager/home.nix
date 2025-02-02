{inputs, ...}: {
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin

    ./browser
    ./hyprland
    ./ime
    ./misc.nix
    ./neovim
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
