# assuming you are on arch linux
cwd=$(pwd)
pacman -S jq yq git base base-develop


# need yay
yay_loc=/tmp/yay
git clone https://aur.archlinux.org/yay.git $yay_loc
cd $yay_loc


if [[ "$(echo $?)" != 0 ]]; then
  echo "something went wrong with the installation of yay"
  if [ -d $yay_loc ]; then
    echo "cleaning up yay folder"
    rm -rf $yay_loc
  fi
  exit 1
else
  echo "success!"
  # makepkg -si
  echo "removing yay repository from downloads"
  rm -rf $yay_loc
  cd -
fi


# install all the dependencies whose "repository" is not null
yq -r \
  '.packages | map(select(.repository != null)) | map(.name) | .[]' ~/.dotfiles/packages/list.yml | \
  xargs yay -S
