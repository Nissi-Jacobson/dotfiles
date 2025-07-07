{ config, lib, pkgs, ... }:

{
  programs.plasma = {
    fonts = {
      general = {
        family = "0xProto Nerd Font";
        pointSize = 10;
      };
      fixedWidth = {
        family = "0xProto Nerd Font Mono";
        pointSize = 10;
      };
      small = {
        family = "0xProto Nerd Font";
        pointSize = 8;
      };
      toolbar = {
        family = "0xProto Nerd Font";
        pointSize = 9;
      };
      menu = {
        family = "0xProto Nerd Font";
        pointSize = 10;
      };
      windowTitle = {
        family = "0xProto Nerd Font";
        pointSize = 10;
      };
    };
  };
}
