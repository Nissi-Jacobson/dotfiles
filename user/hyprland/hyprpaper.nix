{config, pkgs, lib, ...}:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload  = lib.mkForce " /home/nissi/dotfiles/heroin.png";
      wallpaper = lib.mkForce " , /home/nissi/dotfiles/heroin.png";
    };
  };
}
