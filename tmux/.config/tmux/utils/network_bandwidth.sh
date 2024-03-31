#!/usr/bin/env bash

# INTERVAL is equal to 1s because we want to express the bandwidth in sec
readonly INTERVAL=1

# UPLOAD and DOWNLOAD index
readonly UPLOAD=0
readonly DOWNLOAD=1

# SIZE index are the multiple of the unit byte and value the internationally recommended unit symbol in sec
readonly SIZE=(
  [1]='B/s'
  [1024]='kB/s'
  [1048576]='MB/s'
  [1073741824]='GB/s'
)


# interface: mo

ssid_get() {
  echo "$(iwconfig wlan0 | head -n 1 | awk '{print $4}' | cut -d ':' -f 2 | tr -d '"')"
}

interface_get() {
  if type ip >/dev/null; then
    name="$(ip -o route get 192.168.0.0 | awk '{print $5}')"
  fi
  echo $name
}


interface_bytes() {
  local ssid="$1"
  local interface="$2"
  cat "/sys/class/net/$1/statistics/$2_bytes"
}


get_bandwidth() {
  upload="$(interface_bytes "$1" "tx")"
  download="$(interface_bytes "$1" "rx")"

  #wait the interval for Wait for interval to calculate the difference
  sleep "$INTERVAL"

  upload="$(bc <<<"$(interface_bytes "$1" "tx") - $upload")"
  download="$(bc <<<"$(interface_bytes "$1" "rx") - $download")"

  #set to 0 by default useful for non-existent interface
  echo "${upload:-0} ${download:-0}"
}


bandwidth_to_unit() {
  local size=1
  for i in "${!SIZE[@]}"; do
    if (($1 < i)); then
      break
    fi

    size="$i"
  done

  local result="0.00"
  if (($1 != 0)); then
    result="$(bc <<<"scale=2; $1 / $size")"
  fi

  echo "$result ${SIZE[$size]}"
}


main() {
  counter=0
  bandwidth=()

  network_name=""

  if [[ -z $interval_update ]]; then
    interval_update=0
  fi

  if ! command -v bc &> /dev/null
  then
    echo "command bc could not be found!"
    exit 1
  fi

  while true; do
    if ((counter == 0)); then
      counter=60
      network_name="$(interface_get)"
    fi

    IFS=" " read -ra bandwidth <<<"$(get_bandwidth "$network_name")"

    if [[ $show_interface == "true" ]]; then echo -n "[$network_name] "; fi
    echo "󱦳 $(bandwidth_to_unit "${bandwidth[$DOWNLOAD]}")"

    ((counter = counter - 1))
    sleep "$interval_update"
  done
}

main
