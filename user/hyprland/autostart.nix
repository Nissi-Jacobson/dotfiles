{config, pkgs, ...}:

{
  services = {
    blueman-applet.enable = true;
  };
  wayland.windowManager.hyprland = {
    settings = {
      #################
      ### AUTOSTART ###
      #################

      # Autostart necessary processes (like notifications daemons, status bars, etc.)
      # Or execute your favorite apps at launch like this:

      exec-once = [
        "brightnessctl set 0%"
        #$terminal
        "nm-applet"
        #"waybar"
        "hyprpaper"
        "blueman-applet"
      ];
    };
  };
}
