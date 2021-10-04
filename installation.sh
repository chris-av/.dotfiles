#!/bin/bash

# installation steps
. ./utilites/mac-installation.sh


, ./utilites/omz.sh
. ./utilites/symlink-files.sh


# . ./utilites/install-vim.sh
. ./utilites/nvim.sh




# install language servers
. ./utilites/language-servers/tsserver.sh
. ./utilites/language-servers/vscode-extract.sh
. ./utilites/language-servers/lua-lang-server.sh





