{config, pkgs, ...}:

{
  gtk = {
    enable = true;
    gtk3.extraConfig.gtk-decoration-layout = "menu:";
    theme = {
      name = "Tokyonight-Dark";
      package = pkgs.tokyo-night-gtk;
    };
    iconTheme = {
      name = "Tokyonight-Dark";
    };
#    cursorTheme = { 
#      name = gtkCursorTheme;
#      package = pkgs.bibata-cursors;
#    };
  };
}
