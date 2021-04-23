export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"
SPACESHIP_DIR_TRUNC_REPO=false

plugins=(git)

source $ZSH/oh-my-zsh.sh

## User configuration ##

autoload bashcompinit
bashcompinit
_get_comp_words_by_ref() { :; }
compopt() { :; }
_filedir() { :; }

[ -f "$HOME/.aliases" ] && source "$HOME/.aliases"
[ -f "$HOME/.functions" ] && source "$HOME/.functions"
[ -f "$HOME/.config/shell_common/common" ] && source "$HOME/.config/shell_common/common"

eval "$(gh completion -s zsh)"
