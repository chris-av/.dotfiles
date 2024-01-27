#!/usr/bin/sh

# keep a cache of current wallpaper
WALLPAPER_CACHE=~/.cache/wallpaper
DMENU="rofi -dmenu -i"
WALLPAPER_MAPPING=~/.config/hypr/consts/prof-mapping.txt

check_cache() {
  if [ ! -d $WALLPAPER_CACHE ]; then
    echo "did not find wallpaper creating directory $WALLPAPER_CACHE"
    mkdir -p $WALLPAPER_CACHE
  fi
}

update_cache() {
  if [ -n "$(ls -A $WALLPAPER_CACHE)" ]; then
    rm -r $WALLPAPER_CACHE/*
    echo "wallpaper cache contents removed."
  else
    echo "wallpaper cache is already empty."
  fi

  # check to see if image
  first_char=$(echo $1 | cut -b 1)
  if [[ "${first_char}" != "#" ]]; then
    echo "updating cache with image $1"
    cp ~/.config/hypr/wallpapers/$1 ~/.cache/wallpaper/$1
  fi
}

select_wallpaper() {
  check_cache
  prof_theme=$(cat $WALLPAPER_MAPPING | sed -e "s/.*,//" | $DMENU -p "Themes" -theme-str 'window {width: 30%;} listview {lines: 5;}')
  echo $prof_theme
}


update_wallpaper() {
  prof_theme="$(select_wallpaper)"
  prof_image="$(echo $prof_theme | grep -f - $WALLPAPER_MAPPING | sed -e 's/,.*//' )"


  else
    prof_theme="${arr[$prof_image]}"
  fi


  swww img -t wipe --transition-step 190 --transition-duration 1.3 $prof_image
  kitty +kitten themes --dump-theme $prof_theme > ~/.config/kitty/tmp/current-theme.conf
  killall -SIGUSR1 kitty
  killall -SIGUSR1 nvim

  # update waybar style
  cp ~/.config/waybar/themes/$prof_theme.css ~/.config/waybar/tmp/style.css
  pkill -x waybar
  waybar -c ~/.config/waybar/config.jsonc -s ~/.config/waybar/tmp/style.css &

}

update_wallpaper

