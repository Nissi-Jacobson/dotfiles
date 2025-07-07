{ config, lib, pkgs, ... }:

{
  programs.plasma = {
    shortcuts = {
      # Application launchers
      "services/org.kde.krunner.desktop"."_launch" = [ "Meta+Space" "Alt+F2" ];
      "services/org.kde.konsole.desktop"."_launch" = "Meta+Return";
      "services/org.kde.dolphin.desktop"."_launch" = "Meta+E";
      
      # Window management
      "kwin"."Window Close" = "Meta+Q";
      "kwin"."Window Maximize" = "Meta+M";
      "kwin"."Window Minimize" = "Meta+N";
      "kwin"."Window Fullscreen" = "Meta+F";
      
      # Virtual desktops
      "kwin"."Switch to Desktop 1" = "Meta+1";
      "kwin"."Switch to Desktop 2" = "Meta+2";
      "kwin"."Switch to Desktop 3" = "Meta+3";
      "kwin"."Switch to Desktop 4" = "Meta+4";
      "kwin"."Switch to Desktop 5" = "Meta+5";
      
      # Window movement between desktops
      "kwin"."Window to Desktop 1" = "Meta+Shift+1";
      "kwin"."Window to Desktop 2" = "Meta+Shift+2";
      "kwin"."Window to Desktop 3" = "Meta+Shift+3";
      "kwin"."Window to Desktop 4" = "Meta+Shift+4";
      "kwin"."Window to Desktop 5" = "Meta+Shift+5";
      
      # Window tiling (if you want some tiling features)
      "kwin"."Window Quick Tile Left" = "Meta+Left";
      "kwin"."Window Quick Tile Right" = "Meta+Right";
      "kwin"."Window Quick Tile Top" = "Meta+Up";
      "kwin"."Window Quick Tile Bottom" = "Meta+Down";
      
      # Overview and activities
      "kwin"."Overview" = "Meta+W";
      "kwin"."Expose" = "Meta+Ctrl+Up";
      
      # System actions
      "kwin"."Show Desktop" = "Meta+D";
      "plasmashell"."show-on-mouse-pos" = "Meta+V";
      
      # Screenshots
      "services/org.kde.spectacle.desktop"."_launch" = "Print";
      "services/org.kde.spectacle.desktop"."RectangularRegionScreenShot" = "Meta+Shift+S";
    };
  };
}
