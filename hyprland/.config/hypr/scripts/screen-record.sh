#!/usr/bin/env bash
DMENU="rofi -dmenu -i"
ROFI_CONFIG=~/.config/rofi/config.rasi

function getInputAudio() {
  local audio_opts="$(echo 'No Audio'; pactl list | grep "Name" | grep "alsa" | awk '{print $2}')"
  echo "$(echo "$audio_opts" | $DMENU -p "Input Audio " -c $ROFI_CONFIG)"
}

function getVideoOutput() {
  echo "$(hyprctl monitors all | grep "Monitor" | awk '{print $2}' | $DMENU -p "Output Source " -c $ROFI_CONFIG)"
}


function start_recording_w_audio() {
  recording_file="$1"
  audio_src="$2"
  video_src="$3"
  notify-send --app-name="wf-recorder" --icon="$HOME/.icons/camera.jpg" -t 15000 "wf-recorder" "starting screen recording" 
  wf-recorder -f "$recording_file" --audio="$audio_src" -o $video_src
  exit 0
}

function start_recording_no_audio() {
  recording_file="$1"
  video_src="$2"
  notify-send --app-name="wf-recorder" --icon="$HOME/.icons/camera.jpg" -t 15000 "wf-recorder" "starting screen recording" 
  wf-recorder -f "$recording_file" -o $video_src
  exit 0
}

function stop_recording() {
  recording_file="$1"
  pkill -INT -x wf-recorder
  notify-send --app-name="wf-recorder" --icon="$HOME/.icons/kirby.png" -t 15000 "wf-recorder" "recorded to $recording_file" 
  exit 0
}

function check_folders() {
  if [ ! -d ~/Desktop/videos ]; then
    mkdir -p ~/Desktop/videos
  fi
  if [ ! -d ~/.icons ]; then
    mkdir -p ~/.icons
  fi
}


record() {
  check_folders
  videos_dir=~/Desktop/videos
  timestamp=$(date +"%Y%m%d%H%M%S")
  recording_file="$videos_dir/screen_recording_$timestamp.mp4" 



	if pgrep -x "wf-recorder" > /dev/null; then
    # recording is already in progress
    # stop recording
    stop_recording $recording_file
  else
    # no recording process detected
    # start a new recordging
    audio_src="$(getInputAudio)"

    if [ -z "$audio_src" ]; then
      echo "need to select audio source to continue"
      exit 1
    fi

    # specify the output
    # default output_src="eDP-1"
    monitor_count=$(hyprctl monitors all | grep "^Monitor" | wc -l)
    video_src="eDP-1"

    if [ $monitor_count > 1 ]; then
      echo "You got more than one monitor ! ($monitor_count)"
      video_src="$(getVideoOutput)"

      if [ -z "$video_src" ]; then
        echo "need to select video source to continue"
        exit 1
      fi

    else
      echo "You got just one monitor ... "
    fi

    echo "audio source : $audio_src"
    echo "video source : $video_src"
    echo ""
    echo "videos dir : $videos_dir"
    echo "video file : $recording_file"
    echo ""

    if [[ $audio_src == "No Audio" ]]; then
      start_recording_no_audio $recording_file $video_src
      exit 0
    else
      start_recording_w_audio $recording_file $audio_src $video_src
      exit 0
    fi


  fi

}


record

