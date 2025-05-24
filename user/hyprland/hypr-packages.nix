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
    qt6ct
  ];
}
