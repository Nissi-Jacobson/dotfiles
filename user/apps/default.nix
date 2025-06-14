{ config, pkgs, ... }:

{
  
  imports = [
    ./defaultApps.nix
    ./ghostty.nix
    ./kitty.nix
    ./sh.nix
    ./qutebrowser.nix
  ];
}
