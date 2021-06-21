export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"
SPACESHIP_DIR_TRUNC_REPO=false

plugins=(git zsh-completions)

source $ZSH/oh-my-zsh.sh

fpath+=~/.zfunc
compinit

## User configuration ##

[ -f "$HOME/.aliases" ] && source "$HOME/.aliases"
[ -f "$HOME/.functions" ] && source "$HOME/.functions"
[ -f "$HOME/.config/shell_common/common" ] && source "$HOME/.config/shell_common/common"

eval "$(gh completion -s zsh)"
