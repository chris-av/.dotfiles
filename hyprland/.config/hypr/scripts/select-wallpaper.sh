#!/usr/bin/sh

# keep a cache of current wallpaper
DEFAULT_THEME="embark"
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

  # update .current file
  echo $1 > $WALLPAPER_CACHE/.current
  echo $2 >> $WALLPAPER_CACHE/.current

  # check to see if image
  first_char=$(echo $1 | cut -b 1)
  if [[ "${first_char}" != "#" ]]; then
    echo "updating cache with image $1"
    cp ~/.config/hypr/wallpapers/$1 ~/.cache/wallpaper/$1
  fi
}

select_wallpaper() {
  # image.png,blue --> image.png
  local wallpaper=$(cat $WALLPAPER_MAPPING | sed -e "s/,.*//" | $DMENU -p "Themes" -config "$(get_rofi_theme)")
  echo $wallpaper
}

select_theme() {
  # image.png,blue --> blue
  local prof_theme=$(cat $WALLPAPER_MAPPING | sed -e "s/.*,//" | $DMENU -p "Themes" -config "$(get_rofi_theme)")
  echo $prof_theme
}


update_wallpaper() {
  check_cache
  local selected_wallpaper="$(select_wallpaper)"
  local derived_theme="$(echo $selected_wallpaper | grep -f - $WALLPAPER_MAPPING | sed -e 's/.*,//')"

  update_cache $selected_wallpaper $derived_theme

  first_char=$(echo $selected_wallpaper | cut -b 1)
  if [[ "${first_char}" == "#" ]]; then
    echo "using hexcode $selected_wallpaper"
    swww clear $selected_wallpaper
  else
    echo "using image $selected_wallpaper"
    swww img -t wipe --transition-step 190 --transition-duration 1.3 ~/.config/hypr/wallpapers/$selected_wallpaper
  fi

  kitty +kitten themes --dump-theme $derived_theme > ~/.config/kitty/tmp/current-theme.conf
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
  cp ~/.config/waybar/themes/$derived_theme.css ~/.config/waybar/tmp/style.css
  pkill -x waybar
  waybar -c ~/.config/waybar/config.jsonc -s ~/.config/waybar/tmp/style.css &

}

update_wallpaper

