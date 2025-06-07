{config, pkgs, lib, ...}:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload  = " /home/nissi/dotfiles/wallpapers/wp6746996-tokyo-night-wallpapers.jpg";
      wallpaper = " , /home/nissi/dotfiles/wallpapers/wp6746996-tokyo-night-wallpapers.jpg";
    };
  };
}
