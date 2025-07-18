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
    neovim
    lazygit
    fzf
    fd
    ripgrep-all
    clang
    unzip
    ly
    zip 
    fish
    wineWowPackages.waylandFull
    direnv
    wayland-utils
    wl-clipboard
    gvfs
    udisks
    ffmpeg-full
  ];

}

