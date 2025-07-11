{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    wofi
    waybar
    dunst
    libnotify
    hyprpaper
    hyprpaper
    blueman
    brightnessctl
    kdePackages.qtstyleplugin-kvantum
    adwaita-icon-theme
    hyprshot
    hyprlock
    hypridle
    wlogout
  ];
}
