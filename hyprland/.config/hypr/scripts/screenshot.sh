#!/usr/bin/env bash
SWAPPY_DIR=~/Desktop/screenshots
function check_swappy_dir() {
  if [ ! -d $SWAPPY_DIR ]; then
    mkdir $SWAPPY_DIR
  fi
}

function take_screenshot() {
  check_swappy_dir
  timestamp=$(date +"%Y%m%d%H%M%S")
  screenshot_file="$SWAPPY_DIR/screenshot_$timestamp.png" 
  grim -g "$(slurp)" - | swappy -f - -o $screenshot_file
}

take_screenshot

