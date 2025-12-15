{ config, pkgs, ... }:
{
  imports = [
    ./dunst.nix
    ./wpaperd.nix
  ];
}
