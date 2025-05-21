{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  wget
  git
  vscodium
  neovim
  tor-browser
  kdePackages.kdenlive
  auto-cpufreq
  brave
  lutris
  lazygit
  fzf
  fd
  ripgrep-all
  kitty
  kittysay
  clang
  mpv
  qbittorrent
  dconf-editor
  gnome-tweaks
  obsidian
  firefox
  zsh
  fish
  ghostty
  kitty
  direnv
  zed-editor
  nodePackages.nodejs
  ];
}

