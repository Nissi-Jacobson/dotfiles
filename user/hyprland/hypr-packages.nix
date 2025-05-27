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
    sweet
    sweet-nova
    sweet-folders
    candy-icons
    layan-cursors
  ];
}
