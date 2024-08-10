{
  inputs,
  system,
  pkgs,
  ...
}:
{
  home.packages = [
    inputs.j4ger-pkgs.packages."${system}".kwin_geometry_change
    pkgs.nur.repos.shadowrz.klassy-qt6
    pkgs.bibata-cursors
    #pkgs.layan-kde
    #pkgs.layan-gtk-theme
    pkgs.catppuccin-kde
    #pkgs.catppuccin-fcitx5
    #pkgs.oreo-cursors-plus
  ];
  #  programs.plasma = {
  #    };
}
