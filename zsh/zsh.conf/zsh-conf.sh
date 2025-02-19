plugins=(
  git
  zsh-syntax-highlighting
  vi-mode
)

source $ZSH/oh-my-zsh.sh

# remove underline. I think it looks ugly
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none


# load in the colors in accessible array format!
autoload -U colors && colors

# get git and branch info
autoload -Uz vcs_info
precmd() { vcs_info }

# set zstyle
zstyle ':vcs_info:git:*' formats ' %b '
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# set the z shell prompt
PROMPT='%n%{$reset_color%} in %{$fg[yellow]%}%c %{$reset_color%}% %{$fg[blue]%}${vcs_info_msg_0_}%{$reset_color%} '

# set the colors of terminal output
LS_COLORS='no=00;37:fi=00:di=01;34:ln=00;36:pi=01;33:so=01;35:bd=40;33;01:'
export LS_COLORS

eval "$(fzf --zsh)"
