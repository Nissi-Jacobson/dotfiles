{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.enable = true;
  imports = [
    ./monitor.nix
    ./hypr-default-apps.nix
    ./autostart.nix
    ./environment-variables.nix
    ./look-and-feel.nix
    ./keybindings.nix
    ./hypr-packages.nix
  ];
}
