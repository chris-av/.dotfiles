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
LS_COLORS="no=00;37"        # normal; global default
LS_COLORS+=":fi=00"         # file
LS_COLORS+=":di=01;34"      # directory
LS_COLORS+=":ln=00;36"      # symlink
LS_COLORS+=":pi=01;33"      # pipe / fifo
LS_COLORS+=":so=01;35"      # socket
LS_COLORS+=":bd=01;40;33"   # block device
LS_COLORS+=":cd=01;34"         # char
LS_COLORS+=":su=01;34"         # setuid
LS_COLORS+=":sg=01;34"         # setgid
LS_COLORS+=":tw=01;34"         # dir that is sticky + other-writable
LS_COLORS+=":ow=01;34"         # dir that is NOT sticky but is other-writable
export LS_COLORS

eval "$(fzf --zsh)"
