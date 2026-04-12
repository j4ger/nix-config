{ pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      common = {
        default = [ "gtk" ];
      };
      niri = {
        "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
        "org.freedesktop.impl.portal.ScreenCast" = [ "gnome" ];
        "org.freedesktop.impl.portal.Screenshot" = [ "gnome" ];
      };
    };
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome
    ];
  };

  systemd.user.services.xdg-desktop-portal = {
    after = [ "xdg-desktop-autostart.target" ];
  };
  systemd.user.services.xdg-desktop-portal-gtk = {
    after = [ "xdg-desktop-autostart.target" ];
  };
  systemd.user.services.xdg-desktop-portal-gnome = {
    after = [ "xdg-desktop-autostart.target" ];
  };
}
