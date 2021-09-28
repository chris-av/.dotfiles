FILES=(./{.vim,.vimrc})
echo "symlinking files for vim : $(cat FILES)"
for f in ${FILES[*]}; do
  if [ -r "$f" ]; then
    echo "creating symlink for : $f"
    ln -sr $f ~
  fi
done
unset FILES;


# download vim plug, package manager for vim
echo "downloading vim plug ... "
echo ""
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


