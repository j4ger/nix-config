{ pkgs, ... }:
{
  services.fusuma = {
    enable = false;
    settings = {
      swipe = {
        "3" = {
          up = {
            command = "YDOTOOL_SOCKET=/run/ydotoold/socket ${pkgs.ydotool}/bin/ydotool key 29:1 42:1 15:1 15:0 42:0 29:0";
          };
          down = {
            command = "YDOTOOL_SOCKET=/run/ydotoold/socket ${pkgs.ydotool}/bin/ydotool key 29:1 15:1 15:0 29:0";
          };
        };
      };
      pinch = {
        "3" = {
          "in" = {
            command = "YDOTOOL_SOCKET=/run/ydotoold/socket ${pkgs.ydotool}/bin/ydotool key 29:1 17:1 17:0 29:0";
            threshold = 0.6;
          };
          "out" = {
            command = "YDOTOOL_SOCKET=/run/ydotoold/socket ${pkgs.ydotool}/bin/ydotool key 29:1 20:1 20:0 29:0";
            threshold = 0.6;
          };
        };
      };
    };
  };
}
