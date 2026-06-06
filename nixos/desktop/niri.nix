{ pkgs, ... }:
{
  # Avoid NixOS injecting a stripped PATH that shadows user-manager PATH
  systemd.user.services.niri.enableDefaultPath = false;

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.defaultSession = "niri";
  services.displayManager.autoLogin = {
    enable = true;
    user = "j4ger";
  };

  services.desktopManager.plasma6.enable = false;
  programs.niri.enable = true;
  programs.kdeconnect.enable = true;

  # Required for Secret portal (app credential storage)
  services.gnome.gnome-keyring.enable = true;

  services.xserver.videoDrivers = [
    "nvidia"
    "amdgpu"
  ];

  systemd.user.services.niri-flake-polkit = {
    after = [ "xdg-desktop-autostart.target" ];
  };

  environment = {
    pathsToLink = [ "/share/xdg-desktop-portal" ];
    sessionVariables = {
      XDG_CURRENT_DESKTOP = "niri";
      XDG_SESSION_DESKTOP = "niri";
      XDG_SESSION_TYPE = "wayland";
      NIXOS_OZONE_WL = "1";
      QT_QPA_PLATFORM = "wayland;xcb";
      CLUTTER_BACKEND = "wayland";
    };
    systemPackages = with pkgs; [
      wl-clipboard
      kdePackages.kwallet-pam
    ];
    variables = {
      XMODIFIERS = "@im=fcitx";
    };
  };

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [
        fcitx5-gtk
        fcitx5-rime
        qt6Packages.fcitx5-chinese-addons
        fcitx5-table-extra
      ];
      waylandFrontend = true;
    };
  };
}
