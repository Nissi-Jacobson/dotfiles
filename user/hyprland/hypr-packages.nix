{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    wofi
    waybar
    dunst
    libnotify
    hyprpaper
    kitty
    nwg-look
    hyprpaper
    blueman
    brightnessctl
    pywal
    kdePackages.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    sweet
    sweet-nova
    sweet-folders
    candy-icons
    layan-cursors
  ];
}
