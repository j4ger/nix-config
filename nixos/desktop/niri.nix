{ pkgs, ... }:
{
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
    };
    systemPackages = with pkgs; [
      wl-clipboard
      kdePackages.kwallet-pam
      supergfxctl-plasmoid
      polonium
      kdePackages.krohnkite
      kdePackages.dolphin
      vimix-icon-theme
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
