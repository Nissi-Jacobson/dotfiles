{ config, lib, pkgs, cosmicLib, ... }:
{
  wayland.desktopManager.cosmic = {
    enable = true;

    compositor = {
      enable = true;
      keyboard_config = {
        # Example: Switch between QWERTY and Colemak with Win+Space
        xkb = {
          layout = "us,us";
          variant = "colemak, qwerty";
          options = "grp:win_space_toggle";
        };

        numlock_state = cosmicLib.cosmic.mkRON "enum" "BootOn";
      };
    };

  };
}
