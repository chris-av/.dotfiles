# install brew
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


# now install all the apps in the Brewfile
echo "installing everything from Brewfile"
brew bundle




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


# use this for nvim lsp
npm i -g vscode-langservers-extracted

