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
