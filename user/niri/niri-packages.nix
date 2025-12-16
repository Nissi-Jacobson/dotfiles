{ config, pkgs, inputs, ... }:{

  home.packages = [
    # pkgs.gnome-keyring
    pkgs.xdg-desktop-portal-gtk
    pkgs.xdg-desktop-portal-gnome
    #pkgs.kdePackages.polkit-kde-agent-1
    pkgs.xwayland
    pkgs.xwayland-satellite
    inputs.sunsetr.packages.${ pkgs.system }.sunsetr
    pkgs.wofi
    pkgs.waybar
    pkgs.dunst
    pkgs.libnotify
    pkgs.blueman
    pkgs.brightnessctl
    pkgs.kdePackages.qtstyleplugin-kvantum
    pkgs.wlogout
    # pkgs.hyprpaper
    pkgs.wpaperd
    # pkgs.swww
  ];

}
