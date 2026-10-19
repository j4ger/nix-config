{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # GUI apps
    neovide

    # Creative software
    qq
    inkscape
    audacity
    haruna
    gimp3
    libreoffice
    blender
    siyuan
    kicad-small
    handbrake
    qalculate-qt
    lazydocker
    sioyek
    zed-editor
    kdePackages.kdenlive
    (orca-slicer.override {
      withNvidiaGLWorkaround = true;
      glew = (glew.override {
        enableEGL = false;
      });
    })
    
    # Networking/tools
    cloudflared
  ];
}
