{ config, lib, pkgs, ... }:

{
  programs.plasma = {
    configFile = {
      # Disable file indexing (Baloo)
      "baloofilerc"."Basic Settings"."Indexing-Enabled" = false;
      
      # KWin configuration
      "kwinrc" = {
        "Desktops" = {
          "Number" = 5;
          "Rows" = 1;
        };
        "Effect-overview" = {
          "BorderActivate" = 9; # Bottom-right corner
        };
        "Effect-kwin4_effect_translucency" = {
          "ComboboxPopups" = 90;
          "Dialogs" = 90;
          "DropdownMenus" = 90;
          "Menus" = 90;
          "TornOffMenus" = 90;
        };
        "Compositing" = {
          "Backend" = "OpenGL";
          "GLCore" = true;
          "HideCursor" = true;
        };
        "Windows" = {
          "FocusPolicy" = "FocusFollowsMouse";
          "NextFocusPrefersMouse" = true;
        };
      };
      
      # Plasma Desktop configuration
      "plasmarc" = {
        "Theme" = {
          "name" = "breeze-dark";
        };
        "Wallpapers" = {
          "usersWallpapers" = "";
        };
      };
      
      # Konsole configuration
      "konsolerc" = {
        "Desktop Entry" = {
          "DefaultProfile" = "Custom.profile";
        };
        "UiSettings" = {
          "ColorScheme" = "Breeze";
          "WindowColorScheme" = "Breeze";
        };
      };
      
      # Dolphin file manager
      "dolphinrc" = {
        "General" = {
          "BrowseThroughArchives" = true;
          "ShowFullPath" = true;
          "ShowSpaceInfo" = true;
        };
        "IconsMode" = {
          "PreviewSize" = 112;
        };
      };
      
      # Kate text editor
      "katerc" = {
        "General" = {
          "Show Full Path in Title" = true;
          "Show Menu Bar" = true;
          "Show Status Bar" = true;
        };
      };
      
      # System settings
      "kcminputrc" = {
        "Mouse" = {
          "cursorTheme" = "breeze_cursors";
          "cursorSize" = 24;
        };
      };
      
      # Panel configuration
      "plasmashellrc" = {
        "PlasmaViews" = {
          "panelVisibility" = 0; # Always visible
        };
      };
      
      # Notification settings
      "plasmanotifyrc" = {
        "Notifications" = {
          "NormalColor" = "248,248,242";
          "CriticalColor" = "255,85,85";
          "LowPriorityHistory" = false;
        };
      };
    };
  };
}
