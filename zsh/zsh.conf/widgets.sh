# make sure ctrl sequences aren't intercepted
stty -ixon

# other zsh widgets
file_search_widget() {
  ~/scripts/ripsrch
  zle reset-prompt
}

# register your widgets
zle -N file_search_widget

# bind widgets to keys
bindkey '^S' file_search_widget
