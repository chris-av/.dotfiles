#!/usr/bin/sh

# keep a cache of current wallpaper
DEFAULT_THEME="embark"
WALLPAPER_CACHE=~/.cache/wallpaper
DMENU="rofi -dmenu -i"
WALLPAPERS_DIR=~/wallpapers
WALLPAPERS_JSON=~/wallpapers/_wallpapers.json

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

  # update .current file
  echo "$1,$2" > $WALLPAPER_CACHE/.current

  # check to see if image
  first_char=$(echo $1 | cut -b 1)
  if [[ "${first_char}" != "#" ]]; then
    echo "updating cache with image $1"
    cp $WALLPAPERS_DIR/$1 $WALLPAPER_CACHE/$1
  fi
}

get_current_theme() {
  local current_wallpaper_info=$WALLPAPER_CACHE/.current
  if [[ ! -f $current_wallpaper_info ]]; then
    echo "could not find .current in $WALLPAPER_CACHE"
    return 5
  fi

  local current_wallpaper="$(cat $current_wallpaper_info | awk -F ',' '{print $1}')"
  local current_theme="$(cat $current_wallpaper_info | awk -F ',' '{print $2}')"
  echo $current_theme

}

get_rofi_theme() {
  # get the correct rofi theme based on current wallpaper
  # look at ~/.cache/wallpaper/.current for info on the current theme
  local theme="$(get_current_theme)"
  local rasi_file="~/.config/rofi/themes/$theme.rasi"
  echo $rasi_file
}


# this gives a little csv list describing the theme
select_desktop_theme() {
  local theme_key=$(jq -r 'keys | join("\n")' $WALLPAPERS_JSON | $DMENU -p "Themes" -config "$(get_rofi_theme)")

  if [ -z "$theme_key" ]; then
    echo "cancel"
    exit 1
  fi

  local payload=$(jq -r --arg k "$theme_key" '.[$k] | to_entries | map("\(.key),\(.value)") | .[]' $WALLPAPERS_JSON)
  echo -e "theme,$theme_key\n$payload"
}


update_wallpaper() {
  check_cache

  desktop_theme=$(select_desktop_theme)

  # if you did not select a theme exit early
  echo "desktop theme : $desktop_theme"
  if [ "$desktop_theme" == "cancel" ]; then
    echo "did not select a desktop theme"
    exit 1
  fi
  
  theme=$(echo "$desktop_theme" | grep "^theme" | cut -d ',' -f 2)
  kitty_theme=$(echo "$desktop_theme" | grep "^kitty" | cut -d ',' -f 2)
  wallpaper=$(echo "$desktop_theme" | grep "^wallpaper" | cut -d ',' -f 2)
  background=$(echo "$desktop_theme" | grep "^bg_color" | cut -d ',' -f 2)

  # put this info into an associative array
  declare -A theme_arr
  while IFS=, read -r key value; do
    theme_arr["$key"]="$value"
  done <<< $desktop_theme

  # call swww based on whether we're using an image or flat background color
  if [[ -v theme_arr["wallpaper"] ]]; then
    # use swwww setting the wallpaper
    echo "this is a wallpaper theme"
    echo "using image $wallpaper"
    swww img -t wipe --transition-step 190 --transition-duration 1.3 ~/wallpapers/$wallpaper
    update_cache $wallpaper $kitty_theme
  else
    # use swwww setting a flat background image
    echo "this is a flat wallpaper theme"
    echo "using color $background"
    swww clear $background
    update_cache $background $kitty_theme
  fi

  kitty +kitten themes --dump-theme $kitty_theme > ~/.config/kitty/tmp/current-theme.conf
  local restart_processes=("kitty" "nvim")
  for p in "${restart_processes[@]}"; do
    echo "checking process : $p"
    # check if process is running
    if pgrep -x "$p" > /dev/null; then
      echo "restarting : $p"
      killall -SIGUSR1 "$p"
    fi
  done

  # update waybar style
  cp ~/.config/waybar/themes/$kitty_theme.css ~/.config/waybar/tmp/style.css
  pkill -x waybar
  waybar -c ~/.config/waybar/config.jsonc -s ~/.config/waybar/tmp/style.css &

}

update_wallpaper

