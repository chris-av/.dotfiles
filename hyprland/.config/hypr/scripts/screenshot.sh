#!/usr/bin/env bash
SWAPPY_DIR=~/Desktop/screenshots

function check_swappy_dir() {
  if [ ! -d $SWAPPY_DIR ]; then
    mkdir $SWAPPY_DIR
  fi
}

function take_screenshot() {
  check_swappy_dir
  grim -g "$(slurp)" - | swappy -f -
}

take_screenshot

