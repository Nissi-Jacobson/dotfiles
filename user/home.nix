{ config, nix-colors, inputs, lib, ... }:

{

  # importing modules
  imports = [
    ./gnome/default.nix
    ./hyprland/hyprland.nix
    ./apps/default.nix
    ../stylix/stylix-home.nix
    inputs.nix-colors.homeManagerModules.default
    #./cosmic/default.nix
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

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
