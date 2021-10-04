echo "preparing nvim"
echo ""
echo ""


NVIM_CONFIG=./nvim
if [ -r NVIM_CONFIG ]; then
  echo "creating symlink for nvim"
  ln -sr $NVIM_CONFIG ~/.config
fi
unset NVIM_CONFIG;


echo "download packer for nvim ... "
echo ""
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

