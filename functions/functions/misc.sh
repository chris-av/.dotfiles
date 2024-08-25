function socials() {
  github="https://github.com/chris-av"
  linkedin="https://www.linkedin.com/in/christian-a-valenzuela/"
  website="https://chrisav.dev"

  for arg in "$@"; do
    case $arg in
      -l|--linkedin)
        echo "$linkedin"
        ;;
      -g|--github)
        echo "$github"
        ;;
      -w|--website)
        echo "$website"
        ;;
      *)
      ;;
    esac
  done

}
