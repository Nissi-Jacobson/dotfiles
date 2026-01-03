{ config, nix-colors, inputs, lib, pkgs, ... }:

{

  # importing modules
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./hyprland/hyprland.nix
    ../stylix/stylix-home.nix
    ./apps/default.nix
    ./services/default.nix
    ./home-packages.nix
    ./home-programs.nix
    ./daemons/default.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should manage.
  home.username = "nissi";
  home.homeDirectory = "/home/nissi";

  # home.stateVersion = "25.05"; # DO NOT EDIT
  home.stateVersion = "25.05"; # edited to be the same with system packages

  # session variables
  home.sessionVariables = {
    # NIXOS_OZONE_WL = "1";
  };


  # adding dotfiles
  home = {
    file = {
      ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "/home/nissi/dotfiles/nvim";
      ".config/hypr/hyprshot.conf".text = ''
          save_path = "~/Pictures/Screenshots/";
        '';
      # ".config/niri/config.kdl".source = config.lib.file.mkOutOfStoreSymlink "/home/nissi/dotfiles/user/niri/config.kdl";
      #".config/sunsetr/".source = config.lib.file.mkOutOfStoreSymlink "/home/nissi/dotfiles/user/sunsetr/";
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
