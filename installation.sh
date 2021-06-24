# create a symlink for all of your configuration files
FILES=(./repo/{.vim,.vimrc,.zshrc})
for f in ${FILES[*]}; do
  if [ -r "$f" ]; then
    echo "creating symlink for : $f"
    ln -s $f .
  fi
done
unset f;

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
