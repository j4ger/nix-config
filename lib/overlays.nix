{
  inputs,
  system,
  ...
}: let
  # Niri overlay for window manager
  niriOverlay = inputs.niri.overlays.niri;
  # DeepSeek Harness overlay
  dshOverlay = inputs.dsh.overlays.default;
in [
  niriOverlay
  dshOverlay
]
