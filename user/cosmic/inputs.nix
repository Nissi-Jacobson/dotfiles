{ config, ... }:
{
  keyboard_config = {
    numlock_state = "BootOn";
  };
  xkb_config = {
    layout = "us";
    variant = "colemak";
    additionalLayouts = [
      {
        layout = "us";
        variant = "";
      }
    ];
    options = [
      "grp:win_space_toggle"
      "lv3:ralt_switch"
    ];
  };
}
