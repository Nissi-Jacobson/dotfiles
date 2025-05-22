{ config, pkgs, ... }:

{
  home-manager.users.myuser = {
    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = "brave-browser.desktop";
        "x-scheme-handler/http" = "brave-browser.desktop";
        "x-scheme-handler/https" = "brave-browser.desktop";
        "x-scheme-handler/about" = "brave-browser.desktop";
        "x-scheme-handler/unknown" = "brave-browser.desktop";
        "image" = [
        "feh.desktop"
        "qimgv.desktop"
        ];
        "video" = [
          "mpv.desktop"
        ];
        "text" = "nvim.desktop"
      };
    };
  };
}
