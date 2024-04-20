{ pkgs, user, ... }:
{
  hardware.bluetooth.enable = true;

  # Enable GUI
  services.xserver.enable = true;

  # Plasma desktop
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.defaultSession = "plasma";
  services.displayManager.autoLogin = {
    enable = true;
    user = "${user}";
  };
#  services.xserver.desktopManager.plasma5.enable = true;
  services.desktopManager.plasma6.enable = true;
  programs.kdeconnect = {
    enable = true;
  };

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [ fcitx5-rime fcitx5-chinese-addons fcitx5-table-extra fcitx5-pinyin-moegirl fcitx5-pinyin-zhwiki ];
    fcitx5.plasma6Support = true;
  };

  environment = {
    systemPackages = with pkgs; [
      wl-clipboard
      linux-firmware
      kdePackages.kwallet-pam
    ];
    variables = {
      NIXOS_OZONE_WL = "1";
      #GTK_IM_MODULE = "fcitx";
      #GTK_IM_MODULE = "wayland";
      QT_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
      SDL_IM_MODULE = "fcitx";
      GLFW_IM_MODULE = "ibus";
    };
  };

  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
}
