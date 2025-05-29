{ config, pkgs, ... }:

{

  # ghostty customization
  programs.ghostty = {
    #clearDefaultKeybinds = true;
    #installVimSyntax = true;
    settings = {
      theme = "tokyonight_night";
      font-family = "0xProto Nerd Font Mono";
      font-size = 10;
      #background-opacity = 0.69;
      #background-blur = true;
      focus-follows-mouse = true;
      quit-after-last-window-closed = true;
    };
  };

}

