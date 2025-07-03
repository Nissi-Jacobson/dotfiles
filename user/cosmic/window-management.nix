{ config, cosmic-manager, ... }:
{
  services.cosmic-manager.window-management = {
    focus-follows-cursor = false;
    cursor-follows-focus = false;
    raise-on-focus = true;
    # window behaviour
    window-behavior = {
      auto-raise = false;
      click-to-focus = true;
      focus-new-windows = true;
      focus-stealing-prevention = "medium";
    };
    # multiple monitors
    multi-monitor = {
      focus-follows-mouse = true;
      separate-workspaces = false;
      primary-monitor-priority = true;
    };
    # tiling
    tiling = {
      enable = true;
      gaps = 3;
      smart-gaps = true;
      smart-borders = true;
      # Default layout
      default-layout = "master-stack";
      # Layout-specific settings
      layouts = {
        "master-stack" = {
          master-width-factor = 0.6;
          master-count = 1;
          orientation = "horizontal";
        };
        "grid" = {
          columns = 2;
          rows = 2;
          fill-order = "row-first";
        };
        "spiral" = {
          direction = "clockwise";
          ratio = 1.618; # Golden ratio
        };
      };
    };
    keybindings = {
      system = {
        "Super+Return" = "cosmic-terminal";
        "Super+d" = "cosmic-launcher";
        "Super+r" = "cosmic-launcher --run";
        "Super+l" = "lock-screen";
        "Super+Escape" = "cosmic-settings";
        # Power Management
        "Super+Shift+q" = "logout";
        "Super+Shift+r" = "reboot";
        "Super+Shift+s" = "shutdown";
      };
      # Window �anagement
      window = {
        "Super+q" = "close-window";
        "Super+m" = "maximize-window";
        "Super+n" = "mininize-window";
        "Super+f" = "fullscreen-window";
        "Super+t" = "toggle-floating";
        # Window focus
        "Super+h" = "focus-left";
        "Super+j" = "focus-down";
        "Super+k" = "focus-up";
        "Super+l" = "focus-right";
        # Window movement
        "Super+Shift+h" = "move-left";
        "Super+Shift+j" = "move-down";
        "Super+Shift+k" = "move-up";
        "Super+Shift+l" = "move-right";
        # Window resizing
        "Super+Ctrl+h" = "resize-left";
        "Super+Ctrl+j" = "resize-down";"Super+Ctrl+k" = "resize-up";
        "Super+Ctrl+l" = "resize-right";
      };
      # Workspace management
      workspace = {
        "Super+1" = "workspace-1";
        "Super+2" = "workspace-2";
        "Super+3" = "workspace-3";
        "Super+4" = "workspace-4";
        "Super+5" = "workspace-5";
        #"Super+6" = "workspace-6";
        # Move window to workspace
        "Super+Shift+1" = "move-to-workspace-1";
        "Super+Shift+2" = "move-to-workspace-2";
        "Super+Shift+3" = "move-to-workspace-3";
        "Super+Shift+4" = "move-to-workspace-4";
        "Super+Shift+5" = "move-to-workspace-5";
        #"Super+Shift+6" = "move-to-workspace-6";
        # Workspace navigation
        "Super+Tab" = "workspace-next";
        "Super+Shift+Tab" = "workspace-previous";
        "Super+Ctrl+Right" = "workspace-next";
        "Super+Ctrl+Left" = "workspace-previous";
      };
      # Application shortcuts
      applications = {
        #"Super+w" = "firefox";
        #"Super+e" = "cosmic-files";
        #"Super+c" = "code";
        #"Super+s" = "spotify";
        # Media keys
        "XF86AudioPlay" = "media-play-pause";
        "XF86AudioNext" = "media-next";
        "XF86AudioPrev" = "media-previous";
        "XF86AudioRaiseVolume" = "volume-up";
        "XF86AudioLowerVolume" = "volume-down";
        "XF86AudioMute" = "volume-mute";# Brightness
        "XF86MonBrightnessUp" = "brightness-up";
        "XF86MonBrightnessDown" = "brightness-down";
      };
      # Custom shortcuts
      custom = {
        "Super+Print" = "screenshot-full";
        "Super+Shift+Print" = "screenshot-area";
        "Super+Alt+Print" = "screenshot-window";
        # Quick actions
        "Super+Space" = "quick-actions";
        "Super+period" = "emoji-picker";
        "Super+slash" = "help-overlay";
      };
    };
  };
}
