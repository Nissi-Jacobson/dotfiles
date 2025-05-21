{ config, pkgs, ...}:

{
  home.packages = with pkgs; [
    _0xproto
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
  ];
}
