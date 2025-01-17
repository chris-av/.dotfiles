#!/bin/bash

unameOut="$(uname -s)"
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



# install oh my zsh
echo "installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
. ./utilites/omz.sh
. ./utilites/symlink-files.sh


. ./utilites/nvim.sh


# install nvm for managing node
# this will only work if a .bashrc or .zshrc already exists
cur -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

nvm install node


