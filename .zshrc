# If you come from bash you might have to change your $PATH.
export PATH=/usr/local/bin:$PATH
export JAVA_HOME=$(/usr/libexec/java_home)

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh


# if you have nvim installed, make that your default editor!
which nvim > /dev/null 2>&1
if [[ $? == 0 ]]; then
  export EDITOR=nvim
else
  export EDITOR=vim
fi


# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
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

# set the colors of terminal output
LS_COLORS='no=00;37:fi=00:di=01;34:ln=00;36:pi=01;33:so=01;35:bd=40;33;01:'
export LS_COLORS
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# my configurations
# set python version in path
# PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"
# export PATH


# make GNU commands available / replace mac version
# export PATH="/usr/local/opt/coreutils/libexec/gnubin:${PATH}"
# export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}"


source ~/.aliases


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
