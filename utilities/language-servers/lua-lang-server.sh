echo "installing lua language server ..."
echo ""
echo ""

# clone the project
git clone https://github.com/sumneko/lua-language-server ~/.cache/nvim/lua-lang-server
cd ~/.cache/nvim/lua-lang-server/
git submodule update --init --recursive

echo "building the lua lang server binary"
cd 3rd/luamake
compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild

