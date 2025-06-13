{config, pkgs, lib, ...}:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload  = " /home/nissi/dotfiles/wallpapers/sushi_original.png";
      wallpaper = " , /home/nissi/dotfiles/wallpapers/sushi_original.png";
    };
  };
}
