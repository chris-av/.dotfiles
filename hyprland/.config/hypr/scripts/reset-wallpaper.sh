#!/usr/bin/sh

# clear the state in /tmp
if [ -f /tmp/current_wallpaper ]; then
  rm /tmp/current_wallpaper
fi

kitty +kitten themes --dump-theme material > ~/.config/kitty/tmp/current-theme.conf
swww clear 0F111A
killall -SIGUSR1 kitty

