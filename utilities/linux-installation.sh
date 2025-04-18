# assuming you are on arch linux
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
  cd $dotfiles_dir
fi


PKD_DIR=~/.dotfiles/packages
echo $PKD_DIR

MODE=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --all)
      MODE="all"
      shift
      ;;
    --extra)
      MODE="extra"
      shift
      ;;
    --aur)
      MODE="aur"
      shift
      ;;
    *)
      echo "Invalid argument: $1"
      exit 1
      ;;
  esac
done

if [ -z $MODE ]; then

  echo "Select the packages to install : "

  select option in "all" "extra" "aur"; do
    case $option in 
      all)
        MODE="all"
        break
        ;;
      extra)
        MODE="extra"
        break
        ;;
      aur)
        MODE="aur"
        break
        ;;
      *)
        echo "Invalid option, please try again"
        ;;
    esac
  done

fi


case $MODE in 
  all)
    FILTER_CMD='.[] | .name'
    break
    ;;
  extra)
    FILTER_CMD='.[] | select(.repository == "extra") | .name'
    break
    ;;
  aur)
    FILTER_CMD='.[] | select(.repository == "aur") | .name'
    break
    ;;
  *)
    echo "Invalid option, please try again"
    ;;
esac

find $PKD_DIR -type f -name "*.yml" | xargs cat | yq -Mr "$FILTER_CMD" -
