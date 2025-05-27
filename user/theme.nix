{config, pkgs, ...}:

{
  gtk = {
    enable = true;
    gtk3.extraConfig.gtk-decoration-layout = "menu:";
    theme = {
      name = "Sweet-Dark-v40";
    };
    iconTheme = {
      name = "Candy-Icons";
    };
    cursorTheme = { 
      name = "layan-cursors";
    };
  };
  
  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style = {
      name = "Sweet-Dark-v40";
    };
  };
}
