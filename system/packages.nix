{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Download Fonts
  fonts.packages = with pkgs;[
    nerd-fonts._0xproto
    _0xproto
    nerd-fonts.jetbrains-mono
    jetbrains-mono
    times-newer-roman
    #nerd-fonts.symbols-only
  ];
  
  # Downloading packages
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    nwg-look
    libsForQt5.qt5ct
    qt6ct
    libsForQt5.qtstyleplugin-kvantum
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
    wayland-utils
    wl-clipboard
    vscodium
    vscode
    tor-browser
    mpv
    kdePackages.kdenlive
    auto-cpufreq
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
    neofetch
    fastfetch
    xfce.thunar
    ly
    zip 
    pandoc
    libreoffice-still
    onlyoffice-bin
    gvfs
    kdePackages.dolphin
    udisks
    shotcut
    nautilus
    qalculate-gtk
    jdk
    librewolf
    live-server
    tor-browser
    bottles
    (python3.withPackages (ps: with ps; [
      pip
      setuptools
      numba
      numpy
      openai-whisper
      srt
      torch
      # commonly used packages
    ]))
    audacity
    virtualbox
    osu-lazer-bin
    piper
    input-remapper
  ];
}

