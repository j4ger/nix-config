{ pkgs, inputs, system,... }:
{
  home = {
    packages = with pkgs; [
      thunderbird
      qq
      inkscape
      kdePackages.kdenlive
      kdePackages.konqueror
      haruna
      glaxnimate
      #gimp-with-plugins
      darktable
      libreoffice
      wpsoffice-cn
      inputs.j4ger-pkgs.packages.${system}.siyuan
      onlyoffice-bin_latest
      super-slicer.beta
      yesplaymusic
      nur.repos.linyinfeng.wemeet
      #inputs.j4ger-pkgs.packages.${system}.lceda-pro
      kicad-small
      lutris-unwrapped
      handbrake
      krita
      wiliwili
      bruno
      feishu
      wechat-uos
      android-studio
      zoom-us
    ];
  };
  programs = {
    mpv = {
      enable = true;
      config = {
        gpu-api = "opengl";
        gpu-context = "wayland";
        hwdec = "auto-safe";
        vo = "gpu";
        profile = "gpu-hq";
        script-opts = "ytdl_hook-ytdl_path=yt-dlp";
      };
    };
    obs-studio.enable = true;
    zathura.enable = true;
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
}
