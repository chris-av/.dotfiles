#!/usr/bin/sh

# clear the state in /tmp
if [ -f /tmp/current_wallpaper ]; then
  rm /tmp/current_wallpaper
fi

kitty +kitten themes material
swww clear 0F111A

