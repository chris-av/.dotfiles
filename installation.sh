#!/bin/bash


# install bash
which -s brew
if [[ $? != 0 ]] ; then
  # if exit of prev command not zero
  # you don't have homebrew so install it
  echo "you don't have homebrew installing it now ..."
  echo ""
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "actually, you have homebrew!"
  echo "gonna run 'brew update' instead ... "
  echo ""
  brew update
fi


# write installation x-code tools
echo "checking if you have x-code"
xcode-select -p 1>/dev/null
if [[ $? != 0 ]] ; then
  echo "you do not have x-code installing it now ... "
  xcode-select --install
else
  echo "you have xcode, it is here : $(xcode-select -p)"
fi


# create a symlink for all of your configuration files
FILES=(./{.vim,.vimrc,.zshrc,.aliases})
for f in ${FILES[*]}; do
  if [ -r "$f" ]; then
    echo "creating symlink for : $f"
    ln -sr $f ~
  fi
done
unset f;

# download vim plug, package manager for vim
echo "downloading vim plug ... "
echo ""
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


echo "download packer for nvim ... "
echo ""
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim


# run the brew file to download all your apps and utilites ... 
echo "running the 'brew bundle' command ... "
echo ""
brew bundle


# install oh my zsh
echo "installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# install the hacker font, make sure to run the brew bundle first
echo "installing hack nerdfont using brew ... "
brew install font-hack


# install the powerline fonts for vim-airline
echo "making a temporary directory for cloning the powerline fonts installation"
mkdir ~/Downloads/powerline-fonts
echo "cloning the repository to : ~/Downloads/powerline-fonts ... "
git clone https://github.com/powerline/fonts.git ~/Downloads/powerline-fonts --depth=1 
~/Downloads/powerline-fonts/install.sh
echo "cleaning up, removing the directory now ... "
rm -rf ~/Downloads/powerline-fonts/

