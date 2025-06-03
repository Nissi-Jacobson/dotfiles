{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    wofi
    waybar
    dunst
    libnotify
    hyprpaper
    nwg-look
    hyprpaper
    blueman
    brightnessctl
    pywal
    kdePackages.qtstyleplugin-kvantum
    #sweet-folders
    layan-cursors
    hyprshot
    hyprlock
    hypridle
    candy-icons
  ];
}
