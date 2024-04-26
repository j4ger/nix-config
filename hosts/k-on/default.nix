{ config, pkgs, user, ... }:
let
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec "$@"
  '';
in
{
  imports = [ ./hardware-configuration.nix ];

  networking.hostName = "v04-x13";

  sops = {
    secrets.SSH_PVKEY = {
      mode = "0600";
      owner = "${user}";
      path = "/home/" + "${user}" + "/.ssh/id_rsa";
    };
    secrets.GPG_PVKEY = {
      mode = "0600";
      owner = "${user}";
      path = "/home/" + "${user}" + "/.gnupg/GPG_PVKEY";
    };
  };

  # boot = {
    # kernelPackages = pkgs.linuxPackages_xanmod_latest;
    # kernelParams = [
    #   "quiet"
    #   "splash"
    #   "nvidia-drm.modeset=1"
    #   "modprobe.blacklist=nouveau"
    # ];
  # };

  services = {
    tlp.enable = true;
    auto-cpufreq.enable = true;
    power-profiles-daemon.enable = false;
    xserver.videoDrivers = [ "nvidia" "amdgpu" ];
  };
  hardware = {
    nvidia = {
      open = false;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
      modesetting.enable = true;
      prime = {
        offload.enable = true;
        amdgpuBusId = "PCI:105:0:0";
        nvidiaBusId = "PCI:1:0:0";
      };

    };
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        nvidia-vaapi-driver
        vaapiVdpau
        libvdpau-va-gl
      ];
    };
    pulseaudio.support32Bit = true;
  };
  environment = {
    systemPackages = with pkgs; [
      nvidia-offload
      libva
      libva-utils
      glxinfo
    ];
  };

  environment.variables = {
  };
}
