###
# Aliases
###

# Add an "alert" alias for long running commands.
# Use like so: `sleep 10; alert`
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Prefer pre-installed executable `time` over built-in shell
# keyword (h/t https://askubuntu.com/a/86196)
alias time='/usr/bin/time'

# Prompt before removing a file or folder (h/t @thumb@fosstodon.org)
alias rm='rm -i'
