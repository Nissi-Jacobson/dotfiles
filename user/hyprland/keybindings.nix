{ config, pkgs, ... }:

{
wayland.windowManager.hyprland = {
settings = {
###################
### KEYBINDINGS ###
###################

# See https://wiki.hyprland.org/Configuring/Keywords/
"$mainMod" = "SUPER"; # Sets "Windows" key as main modifier
"$shiftMod" = "SUPER_SHIFT";
"$altMod" = "SUPER_ALT";
"$ctrlMod" = "SUPER_CTRL";

# Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
bind = [ 
  "$mainMod, Return, exec, $terminal"
  "$mainMod, Q, killactive,"
  "$mainMod, W, exec, pkill -SIGUSR1 waybar || waybar & disown"
  #"$mainMod, M, exit,"
  "$mainMod, M, exec, wlogout"
  "$mainMod, E, exec, $fileManager"
  "$mainMod, V, togglefloating,"
  "$mainMod, A, exec, $menu"
  #"$mainMod, P, pseudo, # dwindle"
  #"$mainMod, J, togglesplit, # dwindle"

  # ScreenShot
  " , PRINT, exec, hyprshot -m window -o ~/Pictures/Screenshots/"
  "$shiftMod, S, exec, hyprshot -m region -o ~/Pictures/Screenshots/"

  # Hyprlock
  #"$mainMod, L, exec, hyprlock"

  # Blue Light Configuration
  "$mainMod, B, exec, pkill -SIGUSR1 hyprsunset || hyprsunset -t 4000 & disown"

  # vim bindings
  # move windows left, right, up, down with vim bindings
  # "$shiftMod, H, movewindow, l"
  # "$shiftMod, L, movewindow, r"
  # "$shiftMod, K, movewindow, u"
  # "$shiftMod, J, movewindow, d"

  "$ctrlMod, L, layoutmsg, move +col"
  "$ctrlMod, H, layoutmsg, move -col"

  "$mainMod, L, movefocus, r"
  "$mainMod, H, movefocus, l"
  "$mainMod, K, movefocus, u"
  "$mainMod, J, movefocus, d"

  "$mainMod SHIFT, L, layoutmsg, movewindowto r"
  "$mainMod SHIFT, H, layoutmsg, movewindowto l"
  "$mainMod SHIFT, K, layoutmsg, movewindowto u"
  "$mainMod SHIFT, J, layoutmsg, movewindowto d"

  
  # Move focus with mainMod + arrow keys
  "$mainMod, left, movefocus, l"
  "$mainMod, right, movefocus, r"
  "$mainMod, up, movefocus, u"
  "$mainMod, down, movefocus, d"
  "ALT, Tab, cyclenext"
  "ALT_SHIFT, Tab, cyclenext, prev"
  
  # Switch workspaces with mainMod + [0-9]
  "$mainMod, 1, workspace, 1"
  "$mainMod, 2, workspace, 2"
  "$mainMod, 3, workspace, 3"
  "$mainMod, 4, workspace, 4"
  "$mainMod, 5, workspace, 5"
  "$mainMod, 6, workspace, 6"
  "$mainMod, 7, workspace, 7"
  "$mainMod, 8, workspace, 8"
  "$mainMod, 9, workspace, 9"
  "$mainMod, 0, workspace, 10"
  
  # Move active window to a workspace with mainMod + SHIFT + [0-9]
  "$shiftMod, 1, movetoworkspace, 1"
  "$shiftMod, 2, movetoworkspace, 2"
  "$shiftMod, 3, movetoworkspace, 3"
  "$shiftMod, 4, movetoworkspace, 4"
  "$shiftMod, 5, movetoworkspace, 5"
  "$shiftMod, 6, movetoworkspace, 6"
  "$shiftMod, 7, movetoworkspace, 7"
  "$shiftMod, 8, movetoworkspace, 8"
  "$shiftMod, 9, movetoworkspace, 9"
  "$shiftMod, 0, movetoworkspace, 10"

  "$altMod, right, resizeactive, 10 0"
  "$altMod, left, resizeactive, -10 0"
  "$altMod, up, resizeactive, 0 -10"
  "$altMod, down, resizeactive, 0 10"
  
  # Example special workspace (scratchpad)
  #"$mainMod, S, togglespecialworkspace, magic"
  #"$shiftMod, S, movetoworkspace, special:magic"
  "$mainMod, R, togglespecialworkspace, Recent-Tabs"
  "$shiftMod, R, movetoworkspace, special:Recent-Tabs"
  
  # Scroll through existing workspaces with mainMod + scroll
  "$mainMod, mouse_down, workspace, e+1"
  "$mainMod, mouse_up, workspace, e-1"
  
  "$mainMod, mouse:276, killactive"
  "$mainMod, mouse:275, togglefloating"
  
  # Mouse extra buttons for undo/redo
  #", mouse:275, exec, wtype -k ctrl+z"      # Undo
  #", mouse:276, exec, wtype -k ctrl+y"      # Redo

  # Mouse extra buttons for undo/redo
  #", mouse:275, sendshortcut, CTRL, z"      # Undo
  #", mouse:276, sendshortcut, CTRL, y"      # Redo

  # binds for hyprscrolling
  # other keymaps are mentioned near vim bindings

  #"$shiftMod, L, layoutmsg, movewindowto r"
  #"$shiftMod, H, layoutmsg, movewindowto l"

  # increase & decrease window size
  "$mainMod, period, layoutmsg, colresize +conf"
  "$mainMod, comma, layoutmsg, colresize -conf"

  "$mainMod SHIFT, period, layoutmsg, movewindowto r"
  "$mainMod SHIFT, comma, layoutmsg, movewindowto l"
  "$mainMod SHIFT, up, layoutmsg, movewindowto u"
  "$mainMod SHIFT, down, layoutmsg, movewindowto d"


  #"$mainMod, left, movesocus, l"
];

# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = [
  "$mainMod, mouse:272, movewindow"
  "$mainMod, mouse:273, resizewindow"

];
  
  # Laptop multimedia keys for volume and LCD brightness
bindel = [
  ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
  ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
  ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
  ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
  ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
  ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
];
  
# Requires playerctl
bindl = [
  ", XF86AudioNext, exec, playerctl next"
  ", XF86AudioPause, exec, playerctl play-pause"
  ", XF86AudioPlay, exec, playerctl play-pause"
  ", XF86AudioPrev, exec, playerctl previous"
];
};
};
}
