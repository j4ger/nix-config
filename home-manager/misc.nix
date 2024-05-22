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
      siyuan
      super-slicer.beta
      yesplaymusic
      nur.repos.linyinfeng.wemeet
      nur.repos.j4ger.lceda-pro
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
