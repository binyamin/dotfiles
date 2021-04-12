function exec_time_hook {
    # Credit: https://tylercipriani.com/blog/2016/01/19/Command-Timing-Bash-Prompt/

    # do nothing if completing
    [ -n "$COMP_LINE" ] && return

    # don't cause a preexec for $PROMPT_COMMAND
    [ "$BASH_COMMAND" = "$PROMPT_COMMAND" ] && return

    exec_start_time=$(date +'%s')
}

# Format <t> seconds to human-readable text
function format_time {
    local _time=$1

    local _out
    local days=$(( $_time / 60 / 60 / 24 ))
    local hours=$(( $_time / 60 / 60 % 24 ))
    local minutes=$(( $_time / 60 % 60 ))
    local seconds=$(( $_time % 60 ))
    (( $days > 0 )) && _out="${days}d"
    (( $hours > 0 )) && _out="$_out ${hours}h"
    (( $minutes > 0 )) && _out="$_out ${minutes}m"
    _out="$_out ${seconds}s"
    printf "${_out/ /}"
}

function f_exec_time {
    # Exec time
    local exec_end_time=$(date +'%s');
    local time_diff=$((exec_end_time - exec_start_time))

    # TODO color & bold the text
    # TODO check if "took" should be shown
    [[ $time_diff -ge 2 ]] && printf " \[\033[1m\]took \[\033[38;5;11m\]$(format_time $time_diff)\[\033[0m\]"
}