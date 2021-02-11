# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME=""


# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
plugins=(

  git
# zsh-autosuggestions

)

source $ZSH/oh-my-zsh.sh


# for syntax highlighting.
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# remove underline. I think it looks ugly
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# remove all commands with "git commit" from history
# see this link for explanation : https://stackoverflow.com/questions/7243983/how-to-remove-an-entry-from-the-history-in-zsh
LC_ALL=C sed -i '' '/git commit/d' $HISTFILE
LC_ALL=C sed -i '' '/echo /d' $HISTFILE




# load in the colors!
autoload -U colors && colors

# get git and branch info
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats 'on branch %b '

# set the z shell prompt
PROMPT='%n%{$reset_color%} in %{$fg[yellow]%}%c %{$reset_color%}% %{$fg[blue]%}${vcs_info_msg_0_}%{$reset_color%}> '
# PROMPT='%n%{$reset_color%} in %{$fg[yellow]%}%~ %{$reset_color%}% > '


# make GNU commands available / replace mac version
export PATH="/usr/local/opt/coreutils/libexec/gnubin:${PATH}"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}"







# my aliases
# use gnu ls command
alias ls='gls -Ga --color=auto --group-directories-first'
alias lsd='gls -Ga --color=auto --group-directories-first --directory *(D/)'

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Python
alias python=python3


# IP addresses
alias ip="
echo 'localip : $(localip)
ipv4 : $(dig -4 TXT +short o-o.myaddr.l.google.com @ns1.google.com)
ipv6 : $(dig -6 TXT +short o-o.myaddr.l.google.com @ns1.google.com)
'
"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"


# Recursively delete `.DS_Store` files
alias cleanup_ds="find . -type f -name '*.DS_Store' -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

alias date="date '+%A, %x, %r'"

