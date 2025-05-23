{ config, pkgs, ... }:

{
  programs.nwg-look.enable = true;

  gtk = {
    font.name = "0xProto";
  };

}
