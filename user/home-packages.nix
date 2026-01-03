{ config, pkgs, inputs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Allow broken packages
  nixpkgs.config.allowBroken = true;

  home.packages = with pkgs; [
    
    # Programming
    git
    nodePackages.nodejs
    vscode
    zed-editor
    live-server
    mysql-workbench
    eclipses.eclipse-jee
    jdk
    #javaPackages.compiler.openjdk8
    #--
    
    # Utilities
    mpv
    vlc
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
    glib
    kdePackages.filelight
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome
    kdePackages.polkit-kde-agent-1
    appimage-run
    xsettingsd
    #--

    # Applications
    firefox
    kdePackages.kdenlive
    qbittorrent
    obsidian
    logseq
    lorien
    libreoffice-still
    nautilus
    kdePackages.dolphin
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
    #inputs.zen-browser.packages.${ pkgs.stdenv.hostPlatform.system }.default
    brave
    gimp2-with-plugins
    darktable
    ardour
    #--

    # Games
    lutris
    #wineWowPackages.stable
    winetricks
    wineWowPackages.waylandFull
    heroic
    lumafly
    prismlauncher-unwrapped
    #--

  ];

}
