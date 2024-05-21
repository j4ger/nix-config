{ pkgs, ... }:
{
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [
        fcitx5-gtk
        fcitx5-rime
        fcitx5-chinese-addons
        fcitx5-table-extra
      ];
    };
  };
  home.file = {
    ".config/fcitx5/conf/classicui.conf" = {
      source = ./classicui.conf;
      force = true;
    };
    ".config/fcitx5/config" = {
      source = ./config;
      force = true;
    };
    ".config/fcitx5/profile" = {
      source = ./profile;
      force = true;
    };
    ".config/fcitx5/conf/pinyin.conf" = {
      source = ./pinyin.conf;
      force = true;
    };
  };
}
