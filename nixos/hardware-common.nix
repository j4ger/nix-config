{
  pkgs,
  config,
  lib,
  ...
}: {
  hardware = {
    opentabletdriver.enable = false;
    bluetooth = {
      enable = true;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
          Experimental = true;
        };
      };
    };

    nvidia-container-toolkit.enable = true;
    nvidia = {
      open = false;
      package = config.boot.kernelPackages.nvidiaPackages.production;
      modesetting.enable = true;
      powerManagement = {
        enable = true;
        finegrained = true;
      };
    };
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        vaapiVdpau
        libva
        libva-utils
        glxinfo
        # amdvlk
      ];
      extraPackages32 = [
        # pkgs.driversi686Linux.amdvlk
      ];
    };
  };
  environment = {
    systemPackages = with pkgs; [
      linux-firmware
      sbctl
    ];
  };

  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.extraConfig."11-bluetooth-policy" = {
        "wireplumber.settings" = {
          "bluetooth.autoswitch-to-headset-profile" = false;
        };
      };
    };

    fstrim.enable = true;

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
        SUBSYSTEMS=="usb", ATTRS{idVendor}=="303a", ATTRS{idProduct}=="1001", GROUP="plugdev", MODE="0666"
        KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{serial}=="*vial:f64c2b3c*", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
      '';
    };
  };

  boot = {
    bootspec.enable = true;
    loader = {
      systemd-boot = {
        enable = lib.mkForce false; # for lanzaboote
        #consoleMode = "auto";
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      timeout = 3;
    };
    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };
    consoleLogLevel = 0;
    initrd = {
      verbose = false;
      systemd.enable = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
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

      "initcall_blacklist=acpi_cpufreq_init"

      "nvidia.NVreg_EnableGpuFirmware=0"

      "amd_iommu=on"

      "amdgpu.dcdebugmask=0x10"
      "amdgpu.sg_display=0"

      # "acpi_backlight=vendor"
      # "nvidia.NVreg_EnableBacklightHandler=0"
      # "nvidia.NVreg_RegistryDwords=EnableBrightnessControl=0"
    ];
  };
}
