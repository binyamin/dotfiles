###
# Runtimes, languages & stuff
###

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

# Fnm (node) setup
if [ -d $HOME/.local/share/fnm ]; then
  export PATH="$HOME/.local/share/fnm:$PATH"
  eval `fnm env`
fi

# Go setup
if [ -d /usr/local/go ]; then
  export PATH="$PATH:/usr/local/go/bin"
fi

if [ -d $HOME/go ]; then
  export PATH="$PATH:$HOME/go/bin"
fi

# Deno Setup
if [ -d "$HOME/.deno" ]; then
  export DENO_INSTALL="$HOME/.deno"
  export PATH="$DENO_INSTALL/bin:$PATH"
fi

# Bun Setup
if [ -d "$HOME/.bun" ]; then
  export BUN_INSTALL="$HOME/.bun"
  export PATH="$BUN_INSTALL/bin:$PATH"
fi

# Rust (cargo) setup
if [ -d "$HOME/.cargo" ]; then
  export CARGO_DIR="$HOME/.cargo"
  export PATH="$CARGO_DIR/bin:$PATH";
  . "$CARGO_DIR/env"
fi

# Corepack (node.js) config
export COREPACK_ENABLE_PROJECT_SPEC=0

# pnpm global bin
if [ -d "$HOME/.local/share/pnpm" ]; then
  export PNPM_HOME="$HOME/.local/share/pnpm"
  export PATH="$PNPM_HOME:$PATH"
fi

# yarn global installs
if [ -d "$HOME/.yarn/bin" ]; then
  export PATH="$HOME/.yarn/bin:$PATH"
fi

# Turso
if [ -d "$HOME/.turso" ]; then
	export PATH="$HOME/.turso:$PATH"
fi

# Flutter
if [ -d "$HOME/.flutter" ]; then
	export PATH="$HOME/.flutter/bin:$PATH"
fi
