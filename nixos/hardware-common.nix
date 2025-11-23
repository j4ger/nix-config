{
  pkgs,
  config,
  lib,
  inputs,
  system,
  ...
}:
{
  powerManagement.powertop.enable = true;

  hardware = {
    enableAllFirmware = true;

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
      open = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      modesetting.enable = true;
      powerManagement = {
        enable = true;
        finegrained = true;
      };
    };
    amdgpu.opencl.enable = true;
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        libva-vdpau-driver
        libva
        libva-utils
      ];
      extraPackages32 = [
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
      enable = false;
      enableUserService = false;
    };

    fwupd.enable = true;

    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;

    udev = {
      extraRules = ''
        SUBSYSTEMS=="usb", ATTRS{idVendor}=="303a", ATTRS{idProduct}=="00??", GROUP="plugdev", MODE="0666"
        SUBSYSTEMS=="usb", ATTRS{idVendor}=="1a86", ATTRS{idProduct}=="55d3", GROUP="plugdev", MODE="0666"
        SUBSYSTEMS=="usb", ATTRS{idVendor}=="303a", ATTRS{idProduct}=="1001", GROUP="plugdev", MODE="0666"
        KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{serial}=="*vial:f64c2b3c*", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
        # solaar
        KERNEL=="uinput", SUBSYSTEM=="misc", TAG+="uaccess", OPTIONS+="static_node=uinput"
        ACTION != "add", GOTO="solaar_end"
        SUBSYSTEM != "hidraw", GOTO="solaar_end"
        # USB-connected Logitech receivers and devices
        ATTRS{idVendor}=="046d", GOTO="solaar_apply"
        # Lenovo nano receiver
        ATTRS{idVendor}=="17ef", ATTRS{idProduct}=="6042", GOTO="solaar_apply"
        # Bluetooth-connected Logitech devices
        KERNELS == "0005:046D:*", GOTO="solaar_apply"
        GOTO="solaar_end"
        LABEL="solaar_apply"
        # Allow any seated user to access the receiver.
        # uaccess: modern ACL-enabled udev
        TAG+="uaccess"
        # Grant members of the "plugdev" group access to receiver (useful for SSH users)
        #MODE="0660", GROUP="plugdev"
        LABEL="solaar_end"
        # vim: ft=udevrules
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
      kernelModules = [
        "vfio_pci"
        "vfio"
        "vfio_iommu_type1"

        "amdgpu"
      ];
    };
    kernelPackages = pkgs.linuxPackages_xanmod;
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
      # "vfio-pci.ids=10de:28e0,10de:22be"

      "amdgpu.dcdebugmask=0x10"
      "amdgpu.sg_display=0"

      # "acpi_backlight=vendor"
      # "nvidia.NVreg_EnableBacklightHandler=0"
      # "nvidia.NVreg_RegistryDwords=EnableBrightnessControl=0"
    ];
    # extraModprobeConfig = "options vfio-pci ids=10de:28e0,10de:22be";
  };
}
