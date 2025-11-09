{ config, pkgs, lib, ... }:

{
  # Enable dunst notification daemon
  services.dunst = {
    enable = true;
    
    # Let Stylix handle colors, fonts, and theming
    # Only configure layout and behavior
    settings = {
      global = {
        # Display settings
        monitor = 0;
        follow = "mouse";
        
        # Geometry
        width = 300;
        height = 300;
        origin = "top-right";
        offset = "10x50";
        
        # Progress bar
        progress_bar = true;
        progress_bar_height = 10;
        progress_bar_frame_width = 1;
        progress_bar_min_width = 150;
        progress_bar_max_width = 300;
        
        # Appearance (dimensions only, Stylix handles colors)
        transparency = 10;
        separator_height = 2;
        padding = 8;
        horizontal_padding = 8;
        frame_width = 2;
        #separator_color = "frame";
        corner_radius = 10;
        
        # Text formatting (Stylix handles font)
        line_height = 0;
        markup = "full";
        format = "<b>%s</b>\n%b";
        alignment = "left";
        vertical_alignment = "center";
        show_age_threshold = 60;
        word_wrap = true;
        ellipsize = "middle";
        ignore_newline = false;
        stack_duplicates = true;
        hide_duplicate_count = false;
        show_indicators = true;
        
        # Icons
        icon_position = "left";
        min_icon_size = 32;
        max_icon_size = 64;
        
        # History
        sticky_history = true;
        history_length = 20;
        
        # Behavior
        dmenu = "${pkgs.rofi}/bin/rofi -dmenu -p dunst";
        browser = "${pkgs.xdg-utils}/bin/xdg-open";
        always_run_script = true;
        title = "Dunst";
        class = "Dunst";
        
        # Mouse actions
        mouse_left_click = "close_current";
        mouse_middle_click = "do_action";
        mouse_right_click = "close_all";
      };
      
      # Urgency levels - Stylix will apply colors
      # Only set timeout values
      urgency_low = {
        timeout = 5;
      };
      
      urgency_normal = {
        timeout = 10;
      };
      
      urgency_critical = {
        timeout = 0;
      };
    };
  };

  ## Hyprland integration
  #wayland.windowManager.hyprland = {
  #  enable = true;
  #  settings = {
  #    # Window rules for dunst
  #    windowrulev2 = [
  #      "float, class:^(Dunst)$"
  #      "size 300 100, class:^(Dunst)$"
  #      "move 100%-310 50, class:^(Dunst)$"
  #    ];
  #    
  #    # Keybindings for dunst
  #    bind = [
  #      "SUPER, N, exec, dunstctl close"
  #      "SUPER SHIFT, N, exec, dunstctl close-all"
  #      "SUPER CTRL, N, exec, dunstctl history-pop"
  #      "SUPER ALT, N, exec, dunstctl context"
  #    ];
  #  };
  #};

  ## Required packages
  #home.packages = with pkgs; [
  #  libnotify  # For notify-send command
  #  dunst      # Notification daemon
  #];

  # Optional: If you want to completely disable Stylix for dunst
  # and use custom colors, uncomment this section:
  # 
  # stylix.targets.dunst.enable = false;
  # 
  # Then add your custom colors back to the urgency sections above:
  # urgency_low = {
  #   background = "#1E1E2E";
  #   foreground = "#CDD6F4";
  #   frame_color = "#89B4FA";
  #   timeout = 5;
  # };
}
