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
    #THEMES#
    #../theme.nix
#####
    #WAYBAR#
    ./waybar.nix
    #./waybar/default.nix
#####
    #Lock Screen#
    ./hyprlock.nix
#####
    #HYPRIDLE#
    ./hypridle.nix
  ];
}
