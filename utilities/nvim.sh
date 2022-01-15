echo "preparing nvim"
echo ""
echo ""


NVIM_CONFIG=~/.config/nvim
echo "nvim config here : $NVIM_CONFIG"
if [ ! -d "$NVIM_CONFIG" ]; then
  echo "download my neovim github repo"
  git clone git@github.com:chris-av/nvim ~/.config/nvim
else
  echo "nvim already set up! ^^"
fi
unset NVIM_CONFIG;

echo ""
echo ""

echo "check packer for nvim ... "
PACKER_DIR=~/.local/share/nvim/site/pack
if [ ! -d "$PACKER_DIR" ]; then
  echo "downloading packer"
  mkdir -p ~/.local/share/nvim/site/pack
  git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
else
  echo "packer directory already setup : ${PACKER_DIR}"
fi
unset PACKER_DIR

echo ""
