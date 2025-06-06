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
    pywal
    kdePackages.qtstyleplugin-kvantum
    #sweet
    #sweet-nova
    #sweet-folders
    #candy-icons
    tokyo-night-gtk
    adwaita-icon-theme
    #tokyonight-icon-theme
    layan-cursors
    hyprshot
    hyprlock
    hypridle
  ];
}
