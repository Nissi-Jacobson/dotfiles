{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Allow broken packages
  nixpkgs.config.allowBroken = false;

  home.packages = with pkgs; [
    
    # Programming
    git
    nodePackages.nodejs
    vscode
    zed-editor
    jdk
    live-server
    mysql-workbench
    eclipses.eclipse-jee
    #--
    
    # Utilities
    mpv
    kitty
    feh
    networkmanagerapplet
    pandoc
    neofetch
    gnome-disk-utility
    htop
    wireguard-tools
    yazi
    file
    #--

    # Applicatons
    firefox
    kdePackages.kdenlive
    qbittorrent
    obsidian
    libreoffice-still
    nautilus
    qalculate-gtk
    librewolf
    audacity
    brave
    gnome-calendar
    telegram-desktop
    obs-studio
    cheese
    gmetronome
    protonvpn-gui
    #onlyoffice-bin
    kdePackages.okular
    vlc
    gnome-text-editor
    #--

    # Games
    lutris
    #wineWowPackages.stable
    winetricks
    wineWowPackages.waylandFull
    lumafly
    #--

  ];

}
