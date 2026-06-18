{ inputs, system, pkgs, ... }:
{
  # System-level niri configuration
  # This handles greetd, pipewire, and environment variables
  
  # Auto-login via greetd (launches niri directly, no greeter)
  services.greetd = {
    enable = true;
    settings.default_session = {
      user = "j4ger";
      command = "${inputs.niri.packages.${system}.niri-stable}/bin/niri-session";
    };
  };

  # Audio
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Environment variables for Wayland
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    MOZ_ENABLE_WAYLAND = "1";
  };
}
