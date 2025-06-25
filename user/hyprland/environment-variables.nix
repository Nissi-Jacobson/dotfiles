{config, pkgs, ...}:

{
  wayland.windowManager.hyprland = {
    settings = {
      #############################
      ### ENVIRONMENT VARIABLES ###
      #############################

      # See https://wiki.hyprland.org/Configuring/Environment-variables/

      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
        #"QT_QPA_PLATFORMTHEME,qt5ct"
        #"QT_QPA_PLATFORMTHEME_QT6,qt6ct"
        #"QT_STYLE_OVERRIDE,kvantum"
      ];
    };
  };
}
