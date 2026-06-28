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

# edit current shell command in EDITOR
autoload edit-command-line
zle -N edit-command-line
bindkey '^E' edit-command-line
