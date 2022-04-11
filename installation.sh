#!/bin/bash

unameOut="$(uname -s)"
echo "uname : $unameOut"
echo ""

if [[ "$unameOut" == "Darwin" ]]; then 

  echo "you are on a mac, running installation for mac ... "
  # installation steps
  . ./utilites/mac-installation.sh

elif [[ "$unameOut" == "Linux" ]]; then 

  echo "you are on linux!"
  echo ""
  . ./utilities/linux-installation.sh

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


# install language servers
. ./utilites/language-servers/tsserver.sh
. ./utilites/language-servers/vscode-extract.sh
. ./utilites/language-servers/lua-lang-server.sh
. ./utilites/language-servers/pyright-lang-server.sh

