{ config, pkgs, ... }: {
  wayland.windowManager.hyprland.plugins = with pkgs.hyprlandPlugins; [
    hyprscrolling
  ];
  
  wayland.windowManager.hyprland = {
    
    settings = {
      # --- HyprScrolling Plugin --- #
      plugin = {
        hyprscrolling = {
          column_width = 0.5;
          fullscreen_on_one_column = true;
          explicit_column_widths = "0.333, 0.5, 0.667, 1.0";
          focus_fit_method = 1;
          follow_focus = true;
        };

      };

    };

  };
}
