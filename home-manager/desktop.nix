{ pkgs, ... }:
{
  catppuccin.enable = true;
  catppuccin.flavor = "macchiato";

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };

  home.packages = with pkgs; [
    neovide
  ];
}
