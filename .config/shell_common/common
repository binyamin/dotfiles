#!/bin/sh

## Init runtimes/languages ##

# Pyenv (python) setup
if [ -d "$HOME/.pyenv/bin" ]; then
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)" # temporary, until pyenv decides which version they like better
  eval "$(pyenv virtualenv-init -)"
  export PYENV_VIRTUALENV_DISABLE_PROMPT=1
fi

# Rbenv (ruby) Setup
if [ -d "$HOME/.rbenv/bin" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# NVM (node) setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Fnm (node) setup
if [ -d $HOME/.fnm ]; then
  export PATH="$HOME/.fnm:$PATH"
  eval "`fnm env`"
fi

# Go setup
if [ -d /usr/local/go ]; then
  export PATH="$PATH:/usr/local/go/bin"
fi

# Deno Setup
export DENO_INSTALL="$HOME/.deno"
if [ -d $DENO_INSTALL ]; then
  export PATH="$DENO_INSTALL/bin:$PATH"
fi

# Rust (cargo) setup
export CARGO_DIR="$HOME/.cargo"
if [ -d $CARGO_DIR ]; then
  export PATH="$CARGO_DIR/bin:$PATH";
fi


## other ##

# yarn global installs
if [ -d "$HOME/.yarn/bin" ]; then
  export PATH="$HOME/.yarn/bin:$PATH"
fi
