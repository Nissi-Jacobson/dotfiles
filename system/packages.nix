{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Allow NVIDIA GPU Support
  nixpkgs.config.cudaSupport = false;

  # Allow broken packages
  #nixpkgs.config.allowBroken = true;

  # Download Fonts
  fonts.packages = with pkgs;[
    #nerd-fonts.symbols-only

    # sans
    inter-nerdfont
    nerd-fonts.iosevka
    ###

    # serif
    times-newer-roman
    nerd-fonts.tinos
    ###

    # monospace
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts._0xproto
    nerd-fonts.intone-mono
    ###

  ];
  
  # Downloading packages
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.

    # Utilities
    nwg-look
    libsForQt5.qt5ct
    qt6ct
    libsForQt5.qtstyleplugin-kvantum
    unzip
    ly
    zip 
    fish
    direnv
    nix-direnv
    wayland-utils
    wl-clipboard
    gvfs
    udisks
    ffmpeg-full
    mesa-demos
    wget
    clang
    gnumake
    docker-compose
    #--

    # Neovim
    neovim
    lazygit
    fzf
    fd
    ripgrep
    tree-sitter
    tectonic-unwrapped
    imagemagick
    luajitPackages.magick
    #--
  ];

}

