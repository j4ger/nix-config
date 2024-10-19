{pkgs, ...}:
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
    killall
    appimage-run
    nh
    comma
    protontricks
    mangohud
    virtiofsd
    podman-compose
    bottles
    looking-glass-client
    scream
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
  };

  virtualisation = {
    podman = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };
  systemd.tmpfiles.rules = [
    "f /dev/shm/looking-glass 0660 j4ger qemu-libvirtd -"
    "f /dev/shm/scream 0660 alex qemu-libvirtd -"
  ];
  systemd.user.services.scream-ivshmem = {
    enable = true;
    description = "Scream IVSHMEM";
    serviceConfig = {
      ExecStart = "${pkgs.scream}/bin/scream-ivshmem-pulse /dev/shm/scream";
      Restart = "always";
    };
    wantedBy = [ "multi-user.target" ];
    requires = [ "pulseaudio.service" ];
  };
}
