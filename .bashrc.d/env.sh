###
# Environment variables
###

export MICRO_TRUECOLOR=1
export GPG_TTY=$(tty) # See https://stackoverflow.com/a/41054093
export EDITOR=micro

# Load global env secrets
# See https://stackoverflow.com/a/20909045
# if [ -f "$HOME/.env" ]; then
#     export $(grep -v '^#' "$HOME/.env" | xargs -d '\n')
# fi
