function detectLinuxDistro() {
  # method 1: get the first line of the /etc/os-release file
  # distro="$(head -n 1 /etc/os-release | grep -o '".*"' | sed 's/"//g')"
  distro="$(grep "^ID=" /etc/os-release | sed 's/ID=//g')"
  echo $distro

}

