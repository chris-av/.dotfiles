#/usr/bin/env bash
tmux new-session -d -s "personal" -n "main" -c ~/Documents/projects
tmux new-session -d -s "nvim" -n "main" -c ~/.dotfiles/nvim/.config/nvim
