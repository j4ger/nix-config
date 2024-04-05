{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    twemoji-color-font
  ];
  fonts = {
    packages = with pkgs; [
      wqy_zenhei
      noto-fonts
      noto-fonts-cjk
      noto-fonts-cjk-serif
      noto-fonts-emoji
      (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
      twemoji-color-font
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ "Noto Serif CJK SC" ];
        sansSerif = [ "Noto Sans CJK SC" ];
        monospace = [ "FiraCode Nerd Fonts" "Noto Sans Mono CJK SC" "DejaVu Sans Mono" ];
      };
    };
  };
}
