{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # Downloading packages
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
    vscodium
    tor-browser
    mpv
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
    qbittorrent
    obsidian
    zed-editor
    unzip
    qutebrowser
    feh
    qimgv
    networkmanagerapplet
    #font-awesome
    nerd-fonts._0xproto
    _0xproto
    nerd-fonts.jetbrains-mono
    jetbrains-mono
    nerd-fonts.symbols-only
    neofetch
    fastfetch
    kdePackages.dolphin
    xfce.thunar
  ];
}

