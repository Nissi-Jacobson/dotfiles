{ config, pkgs, ... }:

{
  
  imports = [
    #./config.nix
    #./niri.nix
    ./niri-packages.nix
  ];
}
