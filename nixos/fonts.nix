{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    twemoji-color-font
  ];
  fonts = {
    packages = with pkgs; [
      roboto
      maple-mono
      wqy_zenhei
      wqy_microhei
      lxgw-wenkai
      lxgw-neoxihei
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      source-han-sans
      source-han-serif
      source-han-mono
      (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "JetBrainsMono" ]; })
      fira-math
      twemoji-color-font
      corefonts
      vistafonts
      vistafonts-chs
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ "Noto Serif CJK SC" "Noto Serif" "Twitter Color Emoji" ];
        sansSerif = [ "Noto Sans CJK SC" "Noto Sans" "Twitter Color Emoji" ];
        monospace = [ "Maple Mono" "Noto Sans Mono CJK SC" "Twitter Color Emoji" ];
      };
      localConf = ''
      <match target="pattern">
        <test qual="any" name="family">
          <string>Helvetica</string>
        </test>
        <edit name="family" mode="assign"><string>WenQuanYi Zen Hei</string></edit>
      </match>
      '';
    };
  };
}
