#!/usr/bin/env fish

# Check for input
if not set -q argv[1]
    echo "Usage: set-wallpaper-and-theme.fish /path/to/wallpaper.jpg"
    exit 1
end

set WALLPAPER $argv[1]

# Set the wallpaper (using swww — change to hyprpaper if you prefer)
swww img $WALLPAPER &

# Generate theme from wallpaper using pywal
wal -i $WALLPAPER --backend auto

# Apply pywal to GTK3
if test -d ~/.config/gtk-3.0
    cp ~/.cache/wal/colors-gtk3.css ~/.config/gtk-3.0/gtk.css
end

# Apply pywal to GTK4 (optional)
if test -d ~/.config/gtk-4.0
    cp ~/.cache/wal/colors-gtk3.css ~/.config/gtk-4.0/gtk.css
end

# Export for the current session (mostly useful for debugging)
set -x QT_QPA_PLATFORMTHEME qt5ct
set -x QT_STYLE_OVERRIDE wal
set -x GTK_THEME (cat ~/.cache/wal/colors.json | jq -r '.special.background')

# Optionally reload apps like Waybar or others
killall -USR1 waybar ^/dev/null
