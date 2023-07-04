# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh


which nvim > /dev/null 2>&1
if [[ $? == 0 ]]; then
  export EDITOR=nvim
fi


# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(

  git
# zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh


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



# make GNU commands available / replace mac version
# check if Mac with uname AND check if coreutils have been installed with brew info coreutils with zero exit code
unameOut="$(uname -s)"
if [[ $unameOut == "Darwin" ]]; then
  brew ls --version coreutils > /dev/null
  if [ $? -ne 0 ]; then
    echo "did not detect coreutils, running this now"
    brew install coreutils
  fi
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:${PATH}"
  export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}"
fi


source ~/.aliases


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion



# bun completions
if [[ -x "$(command -v bun)" ]] ; then
  # add bun to path
  PATH=$PATH:$HOME/.bun/bin/bun
  [ -s "/Users/chrisvalenzuela/.bun/_bun" ] && source "/Users/chrisvalenzuela/.bun/_bun"
  export BUN_INSTALL="/Users/chrisvalenzuela/.bun"
  export PATH="$BUN_INSTALL/bin:$PATH"
fi




# pnpm
if [[ -x "$(command -v bun)" ]] ; then
  export PNPM_HOME="/Users/chrisvalenzuela/Library/pnpm"
  export PATH="$PNPM_HOME:$PATH"
fi

