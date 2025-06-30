{ config, pkgs, ... }:
{

  #  Session Environment Variables -> sessionVariables
  home.sessionVariables = {
    #QT_QPA_PLATFORMTHEME = "qt5ct";
    #QT_QPA_PLATFORMTHEME_QT6 = "qt6ct";
    BROWSER = "brave-browser";
    DEFAULT_BROWSER = "brave-browser";
    TERMINAL = "${pkgs.kitty}/bin/kitty";
    EDITOR = "nvim";
  };


  # adding XDG stuff here
  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {

        # Web Browser
        "application/x-terminal-emulator" = "kitty.desktop";
        "x-scheme-handler/terminal" = "kitty.desktop";

        # Web Browser
        "text/html" = "brave-browser.desktop";
        "x-scheme-handler/http" = "brave-browser.desktop";
        "x-scheme-handler/https" = "brave-browser.desktop";
        "x-scheme-handler/about" = "brave-browser.desktop";
        "x-scheme-handler/unknown" = "brave-browser.desktop";

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

        # Microsoft Word documents
        "application/msword" = "libreoffie-writer.desktop";
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = "libreoffice-writer.desktop";
        "application/vnd.oasis.opendocument.text" = "libreoffice-writer.desktop";
        "application/rtf" = "libreoffice-writer.desktop";
        
        # Microsoft Excel documents
        "application/vnd.ms-excel" = "libreoffice-calc.desktop";
        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = "libreoffice-calc.desktop";
        "application/vnd.oasis.opendocument.spreadsheet" = "libreoffice-calc.desktop";
        "text/csv" = "libreoffice-calc.desktop";
        
        # Microsoft PowerPoint documents
        "application/vnd.ms-powerpoint" = "libreoffice-impress.desktop";
        "application/vnd.openxmlformats-officedocument.presentationml.presentation" = "libreoffice-impress.desktop";
        "application/vnd.oasis.opendocument.presentation" = "libreoffice-impress.desktop";

        # PDFS
        "application/pdf" = "libreoffice-draw.desktop";
        "application/x-pdf" = "libreoffice-draw.desktop";
        "application/x-bzpdf" = "libreoffice-draw.desktop";
        "application/x-gzpdf" = "libreoffice-draw.desktop";
          
        # Other document formats
        "application/vnd.oasis.opendocument.graphics" = "libreoffice-draw.desktop";
        "application/vnd.visio" = "libreoffice-draw.desktop";
      };
    };
  };
}
