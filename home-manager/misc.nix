{
  pkgs,
  inputs,
  system,
  ...
}: {
  home = {
    packages = with pkgs; [
      qq
      inkscape
      audacity
      haruna
      # glaxnimate
      # gimp
      darktable
      libreoffice
      blender-hip
      # wpsoffice-cn
      siyuan
      # onlyoffice-bin_latest
      # super-slicer.latest
      # yesplaymusic
      go-musicfox
      #nur.repos.linyinfeng.wemeet
      #inputs.j4ger-pkgs.packages.${system}.lceda-pro
      # FIXME: temp fix
      # kicad-small
      # lutris-unwrapped
      #handbrake
      wiliwili
      (bilibili.override {
        commandLineArgs = "--ozone-platform-hint=wayland --enable-wayland-ime";
      })
      wechat-uos
      # zoom-us
      vmware-horizon-client
      rnote
      livecaptions
      pods
      qalculate-qt
      drawio
      vial
      inputs.zen-browser.packages.${system}.default
      sioyek
      zed-editor
      solaar
      alpaca
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
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
  services.udiskie = {
    enable = true;
    settings = {
      program_options = {
        file_manager = "${pkgs.ghostty}/bin/ghostty -e ${pkgs.yazi}/bin/yazi";
      };
    };
  };
}
