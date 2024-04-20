{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    twemoji-color-font
  ];
  fonts = {
    packages = with pkgs; [
      roboto
      recursive
      wqy_zenhei
      noto-fonts
      noto-fonts-cjk
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      source-han-sans
      source-han-serif
      source-han-mono
      (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "JetBrainsMono" ]; })
      twemoji-color-font
      corefonts
      vistafonts
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ "Roboto" "Noto Serif CJK SC" "emoji" ];
        sansSerif = [ "Roboto" "Noto Sans CJK SC" "emoji" ];
        monospace = [ "Recursive Mn Lnr St" "Noto Sans Mono CJK SC" "emoji" ];
      };
    };
  };
}
