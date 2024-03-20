#!/usr/bin/env bash



# get the color
if [[ $TERM_PROFILE == "Gruvbox" || $ITERM_PROFILE == "Gruvbox" ]]; then
  source ~/.config/tmux/utils/themes/gruvbox.sh
elif [[ $TERM_PROFILE == "Catppuccin Latte" || $ITERM_PROFILE == "Catppuccin Latte" ]]; then
  source ~/.config/tmux/utils/themes/catppuccin-latte.sh
elif [[ $TERM_PROFILE == "Matrix" || $ITERM_PROFILE == "Matrix" ]]; then
  source ~/.config/tmux/utils/themes/matrix.sh
fi


