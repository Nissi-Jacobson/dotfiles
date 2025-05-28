{config, pkgs, ...}:

{
  wayland.windowManager.hyprland = {
    settings = {
      ###################
      ### MY PROGRAMS ###
      ###################

      # See https://wiki.hyprland.org/Configuring/Keywords/

      # Set programs that you use
      "$terminal" = "ghostty";
      "$fileManager" = "thunar";
      "$menu" = "wofi --show drun";
    };
  };
}
