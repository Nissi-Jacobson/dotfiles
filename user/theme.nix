{ ... }:
{
  gtk = {
    enable = true;
    theme.name = "Tokyonight-Dark";
    iconTheme.name ="Adwaita";
    font.name = "0xProto Nerd Font Mono";
  };
  
  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "gtk2";
  };
}
