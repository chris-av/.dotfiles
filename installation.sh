#!/bin/bash


# install bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


# create a symlink for all of your configuration files
FILES=(./repo/{.vim,.vimrc,.zshrc})
for f in ${FILES[*]}; do
  if [ -r "$f" ]; then
    echo "creating symlink for : $f"
    ln -s $f .
  fi
done
unset f;

# download vim plug, package manager for vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# run the brew file, only works if the above loop was run successfully
brew bundle



