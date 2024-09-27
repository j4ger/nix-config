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
}
