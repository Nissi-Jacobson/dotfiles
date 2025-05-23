{ config, pkgs, ... }:

{
  
  imports = [
    ./ghostty.nix
    ./kitty.nix
    ./sh.nix
    ./qutebrowser.nix
  ];
}
