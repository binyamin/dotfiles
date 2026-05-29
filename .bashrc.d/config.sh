###
# Bash Settings Tweaks
###

# Usually, the up-arrow jumps to the previous command in the history.
# With this, only jump to those commands in the history which start with the
# same fragment of a command.
# Credit: <https://mhoffman.github.io/2015/05/21/how-to-navigate-directories-with-the-shell.html#history>
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# append to the history file, don't overwrite it
shopt -s histappend

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Don't put duplicate lines or lines starting with space in
# the history.
HISTCONTROL=ignoreboth
