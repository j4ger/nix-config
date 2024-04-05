{ pkgs, user, ... }:
{
  hardware.bluetooth.enable = true;

  # Enable GUI
  services.xserver.enable = true;

  # Plasma desktop
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.displayManager.sddm.wayland.enable = true;
#  services.xserver.desktopManager.plasma5.enable = true;
  services.desktopManager.plasma6.enable = true;


  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [ fcitx5-rime fcitx5-chinese-addons fcitx5-table-extra fcitx5-pinyin-moegirl fcitx5-pinyin-zhwiki ];
    fcitx5.plasma6Support = true;
  };

  environment = {
    systemPackages = with pkgs; [
      wl-clipboard
      linux-firmware
    ];
    variables.NIXOS_OZONE_WL = "1";
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
