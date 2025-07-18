{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Allow NVIDIA GPU Support
  nixpkgs.config.cudaSupport = true;

  # Allow broken packages
  #nixpkgs.config.allowBroken = true;

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
    fish
    direnv
    nodePackages.nodejs
    wayland-utils
    wl-clipboard
    vscode
    mpv
    kdePackages.kdenlive
    lazygit
    fzf
    fd
    ripgrep-all
    kitty
    qbittorrent
    obsidian
    zed-editor
    unzip
    feh
    qimgv
    networkmanagerapplet
    neofetch
    fastfetch
    ly
    zip 
    pandoc
    libreoffice-still
    gvfs
    udisks
    nautilus
    qalculate-gtk
    jdk
    librewolf
    wineWowPackages.waylandFull
    (python3.withPackages (ps: with ps; [
      pip
      numpy
      pytube
    ]))
    audacity
    osu-lazer-bin
    brave
    ffmpeg-full
    gnome-disk-utility
    htop
    ani-cli
    gnome-calendar
    live-server
    steam
  ];

}

