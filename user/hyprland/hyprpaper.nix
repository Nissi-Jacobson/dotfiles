{config, pkgs, ...}:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload  = " /home/nissi/dotfiles/landscape.jpg";
      wallpaper = " , /home/nissi/dotfiles/landscape.jpg";
    };
  };
}
