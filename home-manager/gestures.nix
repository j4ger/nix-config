{
  services.fusuma = {
    enable = true;
    settings = {
      swipe = {
        "3" = {
          up = {
            command = "ydotool key 29:1 42:1 15:1 15:0 42:0 29:0";
          };
          down = {
            command = "ydotool key 29:1 15:1 15:0 29:0";
          };
        };
      };
      pinch = {
        "3" = {
          "in" = {
            command = "ydotool key 29:1 17:1 17:0 29:0";
          };
          "out" = {
            command = "ydotool key 29:1 20:1 20:0 29:0";
          };
        };
      };
    };
  };
}
