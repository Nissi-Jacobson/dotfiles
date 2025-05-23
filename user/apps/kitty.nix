{ config, pkgs, ... }:

{
  # kitty configuration
  programs.kitty = {
    font = {
      name = "0xProto";
      size = 10;
    };
    settings = {
      include = "current-theme.conf";
      background_opacity = "0.8";
      confirm_os_window_close = -1;
    };
  };

}
