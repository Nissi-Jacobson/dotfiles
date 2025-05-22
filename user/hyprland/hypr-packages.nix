{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wofi
    waybar
    (waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental = true"];
    }))
    dunst
    libnotify
    hyprpaper
    kitty

  ];
};
