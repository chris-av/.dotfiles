#!/usr/bin/sh
# get the current wallpapper
# detect the next wallpaper in the list
TEMP=/tmp/current_wallpaper
files=(~/.config/hypr/wallpapers/*)
change=~/.config/hypr/scripts/exec-change-wallpaper.sh

index=$(cat $TEMP)
index=$((index+1))
if [ $index -ge ${#files[@]} ]; then
  index=0
fi
echo $index > $TEMP
swww img -t wipe --transition-step 190 --transition-duration 1.3 "${files[$index]}"


