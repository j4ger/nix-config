{ pkgs, ... }:
{
  services.xserver.enable = true;

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.defaultSession = "plasma";
  services.displayManager.autoLogin = {
    enable = true;
    # FIXME: change username
    user = "j4ger";
  };
  services.desktopManager.plasma6.enable = true;
  programs.kdeconnect = {
    enable = true;
  };

  # FIXME: is this required?
  services.xserver.videoDrivers = [ "intel" "nvidia" ];

  networking = {
    networkmanager.enable = true;
    hosts = {
      "185.199.109.133" = [ "raw.githubusercontent.com" ];
      "185.199.111.133" = [ "raw.githubusercontent.com" ];
      "185.199.110.133" = [ "raw.githubusercontent.com" ];
      "185.199.108.133" = [ "raw.githubusercontent.com" ];
    };
  };

  environment = {
    systemPackages = with pkgs; [
      wl-clipboard
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
}
