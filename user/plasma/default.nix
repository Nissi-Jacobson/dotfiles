{ config, pkgs, plasma-manager, ... }:

{
  imports = [
    ./fonts.nix
    ./workspace.nix
    ./shortcuts.nix
    ./config.nix
  ];
  programs.plasma = {
    enable = true;
  };
}
