{ pkgs, ... }:
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
      gimp-with-plugins
      darktable
      libreoffice
      nur.repos.rewine.wps
      siyuan
      onlyoffice-bin_latest
      super-slicer.beta
      yesplaymusic
      nur.repos.linyinfeng.wemeet
      nur.repos.j4ger.lceda-pro
      kicad
      lutris-unwrapped
      handbrake
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
