{config, pkgs, ...}:

{
  wayland.windowManager.hyprland.settings = [
    scratchpads = {
      name = "Recent-Tabs";
      title = "Recent-Tabs";
      persist = true;
      cover = true;
    };
  ];
}
