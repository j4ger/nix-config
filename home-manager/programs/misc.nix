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
    orca-slicer
    ((pkgs.orca-slicer.override {
      withNvidiaGLWorkaround = true;
      eigen = pkgs.eigen.overrideAttrs (old: rec {
        version = "5.0.1";
        src = pkgs.fetchFromGitLab {
          owner = "libeigen";
          repo = "eigen";
          tag = version;
          hash = "sha256-8TW1MUXt2gWJmu5YbUWhdvzNBiJ/KIVwIRf2XuVZeqo=";
        };
        patches = [ ];
      });
      wxwidgets_3_1 =
        let wx33 = pkgs.wxwidgets_3_3;
        in wx33 // {
          override = _args: wx33.override { withWebKit = true; };
        };
    }).overrideAttrs (old: rec {
      version = "2.4.0-beta";
      src = pkgs.fetchFromGitHub {
        owner = "OrcaSlicer";
        repo = "OrcaSlicer";
        tag = "v${version}";
        hash = "sha256-bx4faVtEkcqBXzSXBXIsntDA4EFxDxWyUeI583tYhdw=";
      };
      patches = builtins.filter
        (p: !(lib.hasInfix "7650" (toString p)))
        (old.patches or [ ]);
    }))
    
    # Networking/tools
    frp
    
    # Gaming
    prismlauncher
  ];
}