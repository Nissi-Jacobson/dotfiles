{ config, lib, pkgs, plasma-manager, ... }:

{
  programs.plasma = {
    workspace = {
      # Let Stylix handle the colorScheme and lookAndFeel
      cursor = {
        theme = "breeze_cursors";
        size = 24;
      };
      
      # Icon theme - will work with Stylix colors
      #iconTheme = "breeze-dark";
      
      # Wallpaper is handled by Stylix if you have stylix.image set
      # Otherwise you can uncomment and set a custom wallpaper:
      # wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Kay/contents/images/1080x1920.png";
      
      # Desktop effects
      #effects = {
      #  blur = {
      #    enable = true;
      #    strength = 5;
      #  };
      #  translucency = {
      #    enable = true;
      #    opacity = 0.8;
      #  };
      #};
    };
  };
}
