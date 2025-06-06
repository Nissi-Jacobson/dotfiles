{ config, nix-colors, inputs, lib, ... }:

{

  # importing modules
  imports = [
    #./gnome/default.nix
    ./hyprland/hyprland.nix
    ./apps/default.nix
    ../stylix.nix
    inputs.nix-colors.homeManagerModules.default
  ];

  # Home Manager needs a bit of information about you and the paths it should manage.
  home.username = "nissi";
  home.homeDirectory = "/home/nissi";

  # home.stateVersion = "25.05"; # DO NOT EDIT
  home.stateVersion = "25.05"; # edited to be the same with system packages

 # adding dotfiles
  home = {
    file = {
      ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "/home/nissi/dotfiles/nvim";
      ".config/hypr/hyprshot.conf".text = ''
          save_path = "~/Pictures/Screenshots/";
        '';
    };
  };

#  qt = {
#    enable = true;
#    platformTheme = "qt6ct";
#  };

  #  Session Environment Variables -> sessionVariables
  home.sessionVariables = {
    #QT_QPA_PLATFORMTHEME = "qt5ct";
    #QT_QPA_PLATFORMTHEME_QT6 = "qt6ct";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
