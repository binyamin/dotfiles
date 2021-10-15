# zmodload zsh/zprof
# zprof

## Native Zsh setup ##

# General options
setopt complete_aliases no_extendedglob notify
setopt no_case_glob

# completion
fpath+=~/.zfunc
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# keybindings + history search
source $HOME/.zsh/keybindings.zsh


## Zinit setup ##

# Load zinit
source /usr/share/zinit/zinit.zsh

# Prompt
zinit light spaceship-prompt/spaceship-prompt
SPACESHIP_DIR_TRUNC_REPO=false

# Additional completions
zinit ice wait lucid blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

## User configuration ##
[ -f "$HOME/.aliases" ] && source "$HOME/.aliases"
[ -f "$HOME/.functions" ] && source "$HOME/.functions"
[ -f "$HOME/.config/shell_common/common" ] && source "$HOME/.config/shell_common/common"

