{ config, cosmic-manager, ... }:
{
  services.cosmic-manager.input = {
    keyboard = {
      layout = "us";
      variant = "colemak";
      repeat-rate = 25;
      repeat-delay = 500;
    };
    mouse = {
      acceleration = 0.0;
      sensitivity = 1.0;
      scroll-factor = 1.0;
      natural-scrolling = false;
      button-mapping = {
        left = "primary";
        right = "secondary";
        middle = "middle";
        back = "back";
        forward = "forward";
      };
    };
    touchpad = {
      natural-scrolling = true;
      tap-to-click = true;
      two-finger-scrolling = true;
      three-finger-scrolling = false;
      edge-scrolling = false;
      gestures = {
        three-finger-swipe = {
          up = "workspace-overview";
          down = "application-overview";
          left = "workspace-next";
          right = "workspace-previous";
        };
        four-finger-swipe = {
          up = "maximize-window";
          down = "minimize-window";
        };
      };
    };
  };
}
