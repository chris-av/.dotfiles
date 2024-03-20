#!/usr/bin/env bash
# foreground            #00e82f
# background            #000000

pane_active_border_fg="#00e82f"
pane_border_fg="#00e82f"
message_style_fg="#00e82f"
message_style_bg="#000000"
status_style_fg="#00e82f"
status_style_bg="#000000"
status_x_fg="#00e82f"
status_x_bg="#000000"
status_y_fg="#00e82f"
status_y_bg="#000000"
status_z_fg="#00e82f"
status_z_bg="#000000"
flags_fg="#00e82f"

# none text before separator
window_x_fg="#000000"
window_x_bg="#000000"

# other windows
window_y_fg="#000000"
window_y_bg="#00e82f"

# flag symbols
window_z_bg="#00e82f"
window_z_fg="#000000"

window_fmt_fg="#00e82f"
window_fmt_bg="#000000"

client_prefix="#3c3836"


left_sep=""
right_sep=""

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
tmux set-option -g status-left "#[bg=${status_x_bg},fg=${status_x_fg}]#{?client_prefix,#[bg=${client_prefix}],} #S"

# Status right
tmux set-option -g status-right ""


# Window option
flags="#{?window_flags,#[fg=${flags_fg}]#{window_flags},}"
current_flags="#{?window_flags,#[fg=${flags_fg}]#{window_flags},}"

tmux set-window-option -g window-status-current-format "#[fg=${window_x_fg},bg=${window_x_bg}] #[fg=${window_y_fg},bg=${window_y_bg}] #I #W${current_flags} #[fg=${window_z_fg},bg=${window_z_bg}]"
tmux set-window-option -g window-status-format "#[fg=${window_fmt_fg}]#[bg=${window_fmt_bg}] #I #W${flags}"
tmux set-window-option -g window-status-activity-style "bold"
tmux set-window-option -g window-status-bell-style "bold"



