{
  pkgs,
  inputs,
  ...
}: {
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
    "/.local/share/fcitx5/rime" = {
      source = inputs.rime-moran;
      recursive = true;
    };
  };
}
