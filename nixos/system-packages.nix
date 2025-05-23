{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gcc
    clang
    glib
    wget
    p7zip
    unzip
    zip
    xdg-utils
    appimage-run
    nh
    comma
    podman-compose
    bottles
    # virtiofsd
    # looking-glass-client
    # scream
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
    alvr.enable = true;
  };

  services.sunshine = {
    enable = false;
    capSysAdmin = true;
    openFirewall = true;
  };

  virtualisation = {
    docker = {
      enable = true;
      storageDriver = "btrfs";
    };
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };
  # systemd.tmpfiles.rules = [
  #   #    "f /dev/shm/looking-glass 0660 j4ger qemu-libvirtd -"
  #   "f /dev/shm/scream 0660 j4ger qemu-libvirtd -"
  # ];
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

  services.flatpak.enable = false;

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
  systemd.tmpfiles.rules = [
    "L+ /run/amd-igpu - - - - /dev/dri/by-path/pci-0000:65:00.0-card"
  ];
}
