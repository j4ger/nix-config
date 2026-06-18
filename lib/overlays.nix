{ inputs, system, ... }:

let
  # Niri overlay for window manager
  niriOverlay = inputs.niri.overlays.niri;
in
[
  niriOverlay
]
