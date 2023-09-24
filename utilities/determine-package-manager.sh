function determinePkgManager() {

  for arg in "$@"; do
    case $arg in 
      "arch")
        echo "pacman"
        ;;
      "ubuntu")
        echo "apt"
        ;;
      *)
        echo "unknown"
        ;;
    esac
  done

}

