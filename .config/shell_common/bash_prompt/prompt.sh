#!/bin/sh

# Custom Bash prompt "galileo"
#
# Version: 0.1.0
# Author: Binyamin Aron Green, https://binyam.in
# License: MIT
# https://github.com/binyamin/dotfiles

source ${BASH_SOURCE%/prompt.sh}/lib/git.sh
source ${BASH_SOURCE%/prompt.sh}/lib/node.sh
source ${BASH_SOURCE%/prompt.sh}/lib/exec_time.sh

function set_prompt {
    local exit_code=$?

    local name="\[\033[1;38;5;10m\]\u@\h\[\033[0m\]";
    local working_dir="\[\033[1;38;5;6m\]\w\[\033[0m\]";

    # or "➜"
    local prompt_symbol prompt_char="❯";

    if [ $exit_code = 0 ]; then
        prompt_symbol="\[\033[1;38;5;10m\]$prompt_char\[\033[0m\]";
    else
        prompt_symbol="\[\033[1;38;5;9m\]$prompt_char\[\033[0m\]";
    fi

    # PS1="$name:$working_dir\$ "
    PS1="$working_dir$(f_git)$(f_node)$(f_exec_time)\n$prompt_symbol "
    PS2="\[\033[1;38;5;3m\]$prompt_char\[\033[0m\] "
}

trap 'exec_time_hook' DEBUG

# Setting the PROMPT_COMMAND will calculate the prompt again for each shell input line
PROMPT_COMMAND=set_prompt