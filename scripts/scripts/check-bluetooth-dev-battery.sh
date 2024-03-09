#/usr/bin/env bash
DEFAULT_THEME="embark"
WALLPAPER_CACHE=~/.cache/wallpaper
DMENU="rofi -dmenu -i"


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


get_battery() {
  local check_device=$(upower --dump | grep "model:" | sed "s/:\s*/:/" | cut -d ":" -f 2 | $DMENU -p "Themes" -config "$(get_rofi_theme)")
  if [ -z "$check_device" ]; then
    echo "cancel"
    exit 1
  fi
  local output="$(upower --dump | sed -n "/$check_device/,/^$/p")"
  local battery="$(echo "$output" | grep 'percentage:' | sed -e 's/percentage:\s+//')"
  local battery_clean="$(echo $battery)"
  # echo "$output"
  echo "$battery"
  notify-send --app-name="Check Battery" -t 15000 "$check_device" "$battery_clean" 
}


get_battery

