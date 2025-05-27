{config, pkgs, ...}:

{
  gtk = {
    enable = true;
    gtk3.extraConfig.gtk-decoration-layout = "menu:";
    theme = {
      name = "Sweet-Dark-v40";
    };
    iconTheme = {
      name = "Candy";
    };
    cursorTheme = { 
      name = "layan-cursors";
    };
  };
}
