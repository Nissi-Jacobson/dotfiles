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
  
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style = {
      name = "kvantum";
    };
  };
}
