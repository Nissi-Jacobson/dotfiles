{ config, pkgs, ... }:

{

  # importing modules
  imports = [
    ./gnome.nix
    ./sh.nix
    ./apps/default.nix
    ./qutebrowser.nix
    ./defaultApps.nix
    ./hyprland.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should manage.
  home.username = "nissi";
  home.homeDirectory = "/home/nissi";

  # home.stateVersion = "25.05"; # DO NOT EDIT
  home.stateVersion = "24.11"; # edited to be the same with system packages

 # adding dotfiles
  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "/home/nissi/dotfiles/nvim";

  #  Session Environment Variables -> sessionVariables
  home.sessionVariables = {
    TERMINAL = "ghostty";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
