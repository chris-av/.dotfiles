# omz
export ZSH=$HOME/.oh-my-zsh

# make neovim the default editor if it exists
which nvim > /dev/null 2>&1
if [[ $? == 0 ]]; then
  export EDITOR=nvim
  export MANPAGER='nvim +Man!'
fi

# make GNU commands available / replace mac version
# check if Mac with uname AND check if coreutils have been installed with brew info coreutils with zero exit code
unameOut="$(uname -s)"
if [[ $unameOut == "Darwin" ]]; then
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:${PATH}"
  export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}"
fi

# if you are using iterm, set TERM_PROFILE, which should be equal to ITERM_PROFILE
if [[ -v "${ITERM_PROFILE}" ]]; then
  export TERM_PROFILE="$ITERM_PROFILE"
fi

if [ -d $HOME/.nvm ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
else
  echo "you should really install nvm"
fi


# bun completions
if [[ -d ~/.bun ]] ; then
  # add bun to path
  [ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
  export BUN_INSTALL="$HOME/.bun"
  export PATH="$BUN_INSTALL/bin:$PATH"
fi


export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# ripgrep
if [ -f ~/.config/ripgrep/.ripgreprc ]; then
  export RIPGREP_CONFIG_PATH=~/.config/ripgrep/.ripgreprc
fi

# expose custom scripts folder
if [ -d ~/scripts ]; then
  export PATH="${PATH}:$HOME/scripts"
fi

# source my custom environment variables
if [ -d ~/env ]; then
  for f in ~/env/*; do
    source $f
  done
fi

if [ -d ~/.spicetify ]; then
  export PATH=$PATH:~/.spicetify
fi

# FZF configs
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# pipx
export PATH=$PATH:/home/chrisv/.local/bin

if command -v pyenv > /dev/null 2>&1; then
  PYENV_ROOT="$HOME/.pyenv"
  [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init - zsh)"
fi

if [ -d ~/go ]; then
  export PATH="$PATH:$HOME/go/bin"
fi
