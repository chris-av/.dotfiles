echo "preparing nvim"
echo "running from $(pwd)"
echo ""
echo ""


NVIM_CONFIG=./nvim
echo "nvim config here : $NVIM_CONFIG"
if [ -d "$NVIM_CONFIG" ]; then
  echo "creating symlink for nvim"
  ln -sr $NVIM_CONFIG ~/.config
fi
unset NVIM_CONFIG;


echo "download packer for nvim ... "
echo ""
PACKER_DIR=~/.local/share/nvim/site/pack
if [ ! -d "$PACKER_DIR" ]; then
  echo "downloading packer"
  mkdir -p ~/.local/share/nvim/site/pack
  git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi
unset PACKER_DIR

