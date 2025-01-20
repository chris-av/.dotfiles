#!/bin/bash

unameOut="$(uname -s)"
dotfiles_dir=$(pwd)
echo "detected system : $unameOut"
echo ""

if [[ "$unameOut" == "Darwin" ]]; then 

  echo "you are on a mac, running installation for mac ... "
  . ./utilites/mac-installation.sh

  stow aliases git nvim tmux vim zsh

elif [[ "$unameOut" == "Linux" ]]; then 

  echo "you are on linux!"
  echo ""
  . ./utilities/linux-installation.sh

  echo "creating symlinks now"
  stow -v aliases git nvim tmux vim zsh \
    cava hyprland mpd waybar mako \
    kitty ghostty \
    rofi wofi\
    fd ripgrep \
    scripts

fi
