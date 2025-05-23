{config, pkgs, ...}:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload  = "../../landscape.jpg";
      wallpaper = "../../landscape.jpg";
    };
  };
}
