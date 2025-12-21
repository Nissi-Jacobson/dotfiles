{ config, lib, pkgs, ... }:
{

  # Comment / Uncomment to toggle 
  programs = {

    direnv.enable = true;

    fish.enable = true;

    nm-applet.enable = true;

    hyprland.enable = true;

    # niri.enable = true;

    xwayland.enable = true;

    kdeconnect.enable = true;

    # ksshaskpass

    # or for seahorse:
    ssh.askPassword = lib.mkForce "${pkgs.seahorse}/libexec/seahorse/ssh-askpass";

    steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
      gamescopeSession.enable = true;
    };

    # gamemode to improve game performance
    gamemode.enable = true;

    # java.enable = true;
  };


}
