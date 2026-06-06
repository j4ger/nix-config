{ pkgs, ... }:
{
  catppuccin.enable = true;
  catppuccin.flavor = "macchiato";

  # Cursor for GTK/X11 apps. Keep in sync with niri cursor.theme in niri/default.nix.
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
