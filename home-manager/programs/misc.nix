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
    (orca-slicer.override {
      withNvidiaGLWorkaround = true;
      glew = (glew.override {
        enableEGL = false;
      });
    })
    
    # Networking/tools
    frp
    
    # Gaming
    prismlauncher
  ];
}
