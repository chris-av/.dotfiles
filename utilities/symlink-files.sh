FILES=(./{.zshrc,.aliases,.gitconfig})
echo "symlinking files other dotfiles : $(cat FILES)"
for f in ${FILES[*]}; do
  if [ -r "$f" ]; then
    echo "creating symlink for : $f"
    ln -sr $f ~
  fi
done
unset FILES;

