{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      bilibili
      thunderbird
      qq
      inkscape
      kdePackages.kdenlive
      glaxnimate
      gimp
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
}
