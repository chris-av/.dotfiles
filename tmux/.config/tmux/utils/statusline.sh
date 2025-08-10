#!/usr/bin/env bash

term_prof="${TERM_PROFILE:-$ITERM_PROFILE}"
source ~/.config/tmux/utils/themes/$term_prof.sh

# set length
tmux set-option -g status-left-length 100
tmux set-option -g status-right-length 100

# pane border styling
tmux set-option -g pane-active-border-style "fg=${pane_active_border_fg}"
tmux set-option -g pane-border-style "fg=${pane_border_fg}"

# message styling
tmux set-option -g message-style "fg=${message_style_fg},bg=${message_style_bg}"

# status bar
tmux set-option -g status-style "fg=${status_style_fg},bg=${status_style_bg}"

# Status left
statusleft="#[bg=${status_x_bg},fg=${status_x_fg}]"
statusleft+="#{?client_prefix,#[bg=${client_prefix_bg}],}"
statusleft+="#{?client_prefix,#[bold]#[fg=${client_prefix_fg}],}"
statusleft+=" #S "
tmux set-option -g status-left "$statusleft"


# Status right
tmux set-option -g status-right "#(~/.config/tmux/utils/network_bandwidth.sh)"


# Window option
flags="#{?window_flags,#[fg=${flags_fg}]#{window_flags},}"
current_flags="#{?window_flags,#[fg=${flags_fg}]#{window_flags},}"

currstatfmt=""
currstatfmt+="#[fg=${window_x_fg},bg=${window_x_bg},]${left_sep}"
currstatfmt+="#[fg=${window_y_fg},bg=${window_y_bg}] #I "
currstatfmt+="#[bg=${window_x_bg}] #W${current_flags} "
currstatfmt+="#[fg=${window_z_fg},bg=${window_z_bg}]${left_sep}"

tmux set-window-option -g window-status-current-format "$currstatfmt"
tmux set-window-option -g window-status-format "#[fg=${window_fmt_fg}]#[bg=${window_fmt_bg}] #I #W${flags}"
tmux set-window-option -g window-status-activity-style "bold"
tmux set-window-option -g window-status-bell-style "bold"
tmux set -wg mode-style bg="${window_sel_bg}",fg="${window_sel_fg}"
