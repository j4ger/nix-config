{ pkgs, config, ... }:
{
  hardware = {
    bluetooth.enable = true;

    nvidia = {
      open = true;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
      modesetting.enable = true;
    };
    opengl = {
      enable = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        nvidia-vaapi-driver
        vaapiVdpau
        libvdpau-va-gl
        libva
        libva-utils
        glxinfo
      ];
    };

    pulseaudio.support32Bit = true;
  };
  environment = {
    systemPackages = with pkgs; [
      linux-firmware
    ];
  };

  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    tlp.enable = false; # is said to be incompatible with asus-ctl
    auto-cpufreq.enable = false; # same as above
    power-profiles-daemon.enable = true;

    supergfxd.enable = true;
    asusd = {
      enable = true;
      enableUserService = true;
    };

    udev = {
      extraRules = ''
        SUBSYSTEMS=="usb", ATTRS{idVendor}=="303a", ATTRS{idProduct}=="00??", GROUP="plugdev", MODE="0666"
        SUBSYSTEMS=="usb", ATTRS{idVendor}=="1a86", ATTRS{idProduct}=="55d3", GROUP="plugdev", MODE="0666"
      ''; # CH340
    };
  };

  boot = {
    bootspec.enable = true;
    loader = {
      systemd-boot = {
          enable = true;
          consoleMode = "auto";
        };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      timeout = 3;
    };
    consoleLogLevel = 0;
    initrd = {
      verbose = false;
      systemd.enable = true;
    };
    plymouth = {
      enable = true;
      theme = "spinner";
    };
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
  };
}
