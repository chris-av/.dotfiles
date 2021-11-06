#!/bin/bash

# installation steps
. ./utilites/mac-installation.sh


. ./utilites/omz.sh
. ./utilites/symlink-files.sh


# . ./utilites/install-vim.sh
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


