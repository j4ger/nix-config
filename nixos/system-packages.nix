{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gcc
    clang
    glib
    wget
    p7zip
    unzip
    zip
    xdg-utils
    (appimage-run.override {
      extraPkgs = pkgs: [ pkgs.xorg.libxshmfence ];
    })
    comma
    podman-compose
    virtiofsd
    virt-viewer
    spice
    spice-gtk
    win-virtio
    win-spice
    looking-glass-client
  ];

  programs = {
    adb.enable = true;
    nix-ld.enable = true;
    fish.enable = true;
    gamemode.enable = true;
    gamescope = {
      enable = true;
      capSysNice = true;
    };
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
    virt-manager.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    ydotool = {
      enable = true;
    };
    evolution = {
      enable = true;
      plugins = [
        pkgs.evolution-ews
      ];
    };
    light.enable = true;
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep 4 --keep-since 4d";
      flake = "/home/j4ger/nix-config";
    };
  };

  services.sunshine = {
    enable = false;
    capSysAdmin = true;
    openFirewall = true;
  };

  services.wivrn = {
    enable = true;
    openFirewall = true;

    defaultRuntime = true;
  };

  virtualisation = {
    docker = {
      enable = true;
      storageDriver = "btrfs";
    };
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        vhostUserPackages = [ pkgs.virtiofsd ];
      };
    };
    spiceUSBRedirection.enable = true;

    waydroid.enable = false;
  };
  services.spice-vdagentd.enable = true;
  systemd.tmpfiles.rules = [
    "L+ /run/amd-igpu - - - - /dev/dri/by-path/pci-0000:65:00.0-card"
    "f /dev/shm/looking-glass 0660 j4ger qemu-libvirtd -"
    "L+ /var/lib/qemu/firmware - - - - ${pkgs.qemu}/share/qemu/firmware"
  ];
  # systemd.user.services.scream-ivshmem = {
  #   enable = false;
  #   description = "Scream IVSHMEM";
  #   serviceConfig = {
  #     ExecStart = "${pkgs.scream}/bin/scream-ivshmem-pulse /dev/shm/scream";
  #     Restart = "always";
  #   };
  #   wantedBy = [ "multi-user.target" ];
  #   requires = [ "pulseaudio.service" ];
  # };

  services.flatpak.enable = true;

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
  services.printing.enable = true;

  services = {
    ollama = {
      enable = true;
      acceleration = "cuda";
      host = "0.0.0.0";
    };
  };
}
