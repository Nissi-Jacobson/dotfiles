{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Allow broken packages
  nixpkgs.config.allowBroken = false;

  home.packages = with pkgs; [
    git
    firefox
    nodePackages.nodejs
    vscode
    mpv
    kdePackages.kdenlive
    kitty
    qbittorrent
    obsidian
    zed-editor
    feh
    qimgv
    networkmanagerapplet
    neofetch
    fastfetch
    pandoc
    libreoffice-still
    nautilus
    qalculate-gtk
    jdk
    librewolf
    audacity
    osu-lazer-bin
    brave
    gnome-disk-utility
    htop
    ani-cli
    gnome-calendar
    live-server
    steam

    (python3.withPackages (ps: with ps; [
      pip
      ipython
    ]))

  ];
}
