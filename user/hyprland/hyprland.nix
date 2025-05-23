{ config, pkgs, ... }:
#####
{
  wayland.windowManager.hyprland.enable = true;
  imports = [
#####
    #HYPRLAND STUFF#
    ./monitor.nix
    ./hypr-default-apps.nix
    ./autostart.nix
    ./environment-variables.nix
    ./look-and-feel.nix
    ./input.nix
    ./keybindings.nix
    ./hypr-packages.nix
#####
    #WALLPAPER#
    ./hyprpaper.nix
#####
    #DEFAULT APPS#
    ../apps/default.nix
#####
    #SCRATCH PADS#
    #./scratchpadInit.nix
#####
    #GTK THEME#
    ./hypr-gtk.nix
#####
    #WAYBAR#
    ./waybar.nix
  ];
}
