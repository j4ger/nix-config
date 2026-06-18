{ inputs, ... }:
{
  imports = [
    ./modules
    ./shared
    ./programs
    ./services
    ./wm
    ./themes
  ];

  home = {
    username = "j4ger";
    homeDirectory = "/home/j4ger";
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.11";
}
