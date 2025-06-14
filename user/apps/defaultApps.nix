{ config,  ... }:
{
  # adding XDG stuff here
  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        # Web Browser
        "text/html" = "librewolf.desktop";
        "x-scheme-handler/http" = "librewolf.desktop";
        "x-scheme-handler/https" = "librewolf.desktop";
        "x-scheme-handler/about" = "librewolf.desktop";
        "x-scheme-handler/unknown" = "librewolf.desktop";
        # Text Files
        "text/plain" = "nvim.desktop";
        "text/x-python" = "nvim.desktop";
        "text/x-shellscript" = "nvim.desktop";
        "text/x-makefile" = "nvim.desktop";
        "application/x-yaml" = "nvim.desktop";
        "application/json" = "nvim.desktop";
        "text/markdown" = "nvim.desktop";
        "text/x-log" = "nvim.desktop";
        # Images
        "image/jpeg" = "qimgv.desktop";
        "image/jpg" = "qimgv.desktop";
        "image/png" = "qimgv.desktop";
        "image/gif" = "qimgv.desktop";
        "image/webp" = "qimgv.desktop";
        "image/svg+xml" = "qimgv.desktop";
        "image/bmp" = "qimgv.desktop";
        "image/tiff" = "qimgv.desktop";
        "image/x-pixmap" = "qimgv.desktop";
        "image/x-portable-pixmap" = "qimgv.desktop";
        # Videos
        "video/mp4" = "mpv.desktop";
        "video/x-msvideo" = "mpv.desktop";
        "video/quicktime" = "mpv.desktop";
        "video/x-matroska" = "mpv.desktop";
        "video/webm" = "mpv.desktop";
        "video/x-flv" = "mpv.desktop";
        "video/x-ms-wmv" = "mpv.desktop";
        # Audio
        "audio/mpeg" = "mpv.desktop";
        "audio/mp3" = "mpv.desktop";
        "audio/wav" = "mpv.desktop";
        "audio/x-wav" = "mpv.desktop";
        "audio/flac" = "mpv.desktop";
        "audio/x-flac" = "mpv.desktop";
        "audio/ogg" = "mpv.desktop";
        "audio/x-vorbis+ogg" = "mpv.desktop";
      };
    };
  };
}
