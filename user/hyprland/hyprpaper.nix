{config, pkgs, ...}:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload  = "../../speedmeter.webp";
      wallpaper = "../../speedmeter.webp";
    };
  };
}
