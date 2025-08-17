plugins=(
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
LS_COLORS='no=00;37'
LS_COLORS+=":fi=00"
LS_COLORS+=":di=01;34"
LS_COLORS+=":ln=00;36"
LS_COLORS+=":pi=01;33"
LS_COLORS+=":so=01;35"
LS_COLORS+=":bd=01;40;33"
LS_COLORS+=":cd=34"
LS_COLORS+=":su=34"
LS_COLORS+=":sg=34"
LS_COLORS+=":tw=34"
LS_COLORS+=":ow=34"
export LS_COLORS

eval "$(fzf --zsh)"
