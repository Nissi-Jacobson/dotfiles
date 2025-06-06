{config, pkgs, lib, ...}:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload  = lib.mkForce " /home/nissi/dotfiles/landscape.jpg";
      wallpaper = lib.mkForce " , /home/nissi/dotfiles/landscape.jpg";
    };
  };
}
