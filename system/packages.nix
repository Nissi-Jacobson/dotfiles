{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    neovim
    clang
    firefox
    zsh
    fish
    ghostty
    direnv
    nodePackages.nodejs
    wl-clipboard
  ];
}

