{ config, pkgs, ... }:

{
  
  imports = [
    ./defaultApps.nix
    ./ghostty.nix
    ./kitty.nix
    ./sh.nix
    ./qutebrowser.nix
    ./foot.nix
    ./wezterm.nix
    ./neovim.nix
    ./wofi.nix
  ];
}
