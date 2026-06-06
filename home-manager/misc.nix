{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];
  home = {
    packages = with pkgs; [
      qq
      inkscape
      audacity
      haruna
      gimp3
      libreoffice
      blender
      siyuan
      go-musicfox
      kicad-small
      handbrake
      rnote
      qalculate-qt
      lazydocker
      vial
      sioyek
      zed-editor
      scrcpy
      kdePackages.kdenlive
      orca-slicer
      frp
      prismlauncher
    ];
  };
  programs = {
    zen-browser.enable = true;
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
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };
  services.udiskie = {
    enable = true;
    settings = {
      program_options = {
        file_manager = "${pkgs.alacritty}/bin/alacritty -e ${pkgs.yazi}/bin/yazi";
      };
    };
  };
}
