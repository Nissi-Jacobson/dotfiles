{ config, pkgs, inputs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Allow broken packages
  nixpkgs.config.allowBroken = false;

  home.packages = with pkgs; [
    
    # Programming
    git
    nodePackages.nodejs
    vscode-fhs
    zed-editor
    #vscodium
    jdk
    pango
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
    htop
    yazi
    ani-cli
    ani-skip
    tmux
    kdePackages.filelight
    #--

    # Applications
    firefox
    kdePackages.kdenlive
    qbittorrent
    obsidian
    logseq
    libreoffice-still
    nautilus
    qalculate-gtk
    librewolf
    obs-studio
    gmetronome
    protonvpn-gui
    #onlyoffice-bin
    kdePackages.okular
    gnome-text-editor
    gnome-system-monitor
    masterpdfeditor4
    cheese
    inputs.zen-browser.packages.${ pkgs.system }.default
    brave
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
