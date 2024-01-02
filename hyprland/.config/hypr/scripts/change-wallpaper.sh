#!/usr/bin/sh
# get the current wallpapper
# detect the next wallpaper in the list
TEMP=/tmp/current_wallpaper
files=(~/.config/hypr/wallpapers/*)

index=$(cat $TEMP)
index=$((index+1))
if [ $index -ge ${#files[@]} ]; then
  index=0
fi
echo $index > $TEMP


# convert our mapping to an associative array
declare -A arr
prof_theme=""
IFS=","
while read c1 c2 leftovers;do
  path="$HOME/.config/hypr/wallpapers/$c1"
  arr[$path]=$c2;
done < ~/.config/hypr/consts/prof-mapping.txt


prof_image="${files[$index]}"


if [[ ! -v "arr[$prof_image]" ]]; then
  # echo "could not find theme for $prof_image, defaulting to dark"
  prof_theme="dark"
else
  # echo "found theme for $prof_image!"
  prof_theme="${arr[$prof_image]}"
fi


# echo $index
# echo $prof_image
# echo $prof_theme

swww img -t wipe --transition-step 190 --transition-duration 1.3 $prof_image
kitty +kitten themes --dump-theme $prof_theme > ~/.config/kitty/tmp/current-theme.conf
killall -SIGUSR1 kitty
killall -SIGUSR1 nvim

# update waybar style
cp ~/.config/waybar/themes/$prof_theme.css ~/.config/waybar/tmp/style.css
pkill -x waybar
waybar -c ~/.config/waybar/config.jsonc -s ~/.config/waybar/tmp/style.css &

