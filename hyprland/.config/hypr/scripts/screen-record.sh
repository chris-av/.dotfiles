#!/usr/bin/env bash

wfrecorder_check() {
  if [ ! -d ~/Desktop/videos ]; then
    mkdir -p ~/Desktop/videos
  fi
  if [ ! -d ~/.icons ]; then
    mkdir -p ~/.icons
  fi
  videos_dir=~/Desktop/videos
  timestamp=$(date +"%Y%m%d%H%M%S")
  recording_file="$videos_dir/screen_recording_$timestamp.mp4" 
  echo "videos dir : $videos_dir"
  echo "video file : $recording_file"


	if pgrep -x "wf-recorder" > /dev/null; then
      echo $recording_file
			pkill -INT -x wf-recorder
			notify-send --app-name="wf-recorder" --icon="$HOME/.icons/kirby.png" -t 15000 "wf-recorder" "recorded to $recording_file" 
			exit 0
    else
			notify-send --app-name="wf-recorder" --icon="$HOME/.icons/camera.jpg" -t 15000 "wf-recorder" "starting screen recording" 
      wf-recorder -f "$recording_file"
      exit 0
	fi
}


wfrecorder_check

