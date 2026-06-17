{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gcc
    clang
    glib
    wget
    vim
    p7zip
    unzip
    zip
    xdg-utils
    ddcutil
    (appimage-run.override {
      extraPkgs = pkgs: [ pkgs.xorg.libxshmfence ];
    })
    comma
  ];

  programs = {
    nix-ld.enable = true;
    fish.enable = true;
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
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep 4 --keep-since 4d";
      flake = "/home/j4ger/nix-config";
    };
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
        vhostUserPackages = [ pkgs.virtiofsd ];
      };
    };
    spiceUSBRedirection.enable = true;

    waydroid.enable = false;
  };
  systemd.tmpfiles.rules = [
    "L+ /run/amd-igpu - - - - /dev/dri/by-path/pci-0000:65:00.0-card"
    "f /dev/shm/looking-glass 0660 j4ger qemu-libvirtd -"
    "L+ /var/lib/qemu/firmware - - - - ${pkgs.qemu}/share/qemu/firmware"
  ];

  services.flatpak.enable = false;

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
  services.printing.enable = true;

}
