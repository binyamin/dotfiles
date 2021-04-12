function f_git {
    local git_status_untracked="?"
    local git_status_added="+"
    local git_status_modified="!"
    local git_status_renamed="»"
    local git_status_deleted="✘"
    local git_status_stashed="$"
    local git_status_unmerged="="
    local git_status_ahead="⇡"
    local git_status_behind="⇣"
    local git_status_diverged="⇕"

    # Credits: github:sapegin/dotfiles and github:denysdovhan/spaceship-prompt
    if [[ "true" == "$(git rev-parse --is-inside-work-tree 2>/dev/null)" ]]; then
        local branch="$(git symbolic-ref HEAD 2>/dev/null)"
		branch="${branch##refs/heads/}"

        local git_status git_index=$(command git status --porcelain -b 2> /dev/null);

        # Check for untracked files
        if $(printf "$git_index" | command grep -E '^\?\? ' &> /dev/null); then
            git_status="$git_status_untracked$git_status"
        fi

        # Check for staged files
        if $(printf "$git_index" | command grep '^A[ MDAU] ' &> /dev/null); then
            git_status="$git_status_added$git_status"
        elif $(printf "$git_index" | command grep '^M[ MD] ' &> /dev/null); then
            git_status="$git_status_added$git_status"
        elif $(printf "$git_index" | command grep '^UA' &> /dev/null); then
            git_status="$git_status_added$git_status"
        fi

        # Check for modified files
        if $(printf "$git_index" | command grep '^[ MARC]M ' &> /dev/null); then
            git_status="$git_status_modified$git_status"
        fi

        # Check for renamed files
        if $(printf "$git_index" | command grep '^R[ MD] ' &> /dev/null); then
            git_status="$git_status_renamed$git_status"
        fi

        # Check for deleted files
        if $(printf "$git_index" | command grep '^[MARCDU ]D ' &> /dev/null); then
            git_status="$git_status_deleted$git_status"
        elif $(printf "$INDEX" | command grep '^D[ UM] ' &> /dev/null); then
            git_status="$git_status_deleted$git_status"
        fi

        # Check for stashes
        if $(command git rev-parse --verify refs/stash >/dev/null 2>&1); then
            git_status="$git_status_stashed$git_status"
        fi

        # Check for unmerged files
        if $(printf "$git_index" | command grep '^U[UDA] ' &> /dev/null); then
            git_status="$git_status_unmerged$git_status"
        elif $(printf "$git_index" | command grep '^AA ' &> /dev/null); then
            git_status="$git_status_unmerged$git_status"
        elif $(printf "$git_index" | command grep '^DD ' &> /dev/null); then
            git_status="$git_status_unmerged$git_status"
        elif $(printf "$git_index" | command grep '^[DA]U ' &> /dev/null); then
            git_status="$git_status_unmerged$git_status"
        fi

        # Check whether branch is ahead
        local is_ahead=false
        if $(printf "$git_index" | command grep '^## [^ ]\+ .*ahead' &> /dev/null); then
            is_ahead=true
        fi

        # Check whether branch is behind
        local is_behind=false
        if $(printf "$git_index" | command grep '^## [^ ]\+ .*behind' &> /dev/null); then
            is_behind=true
        fi

        # Check wheather branch has diverged
        if [[ "$is_ahead" == true && "$is_behind" == true ]]; then
            git_status="$git_status_diverged$git_status"
        else
            [[ "$is_ahead" == true ]] && git_status="$git_status_ahead$git_status"
            [[ "$is_behind" == true ]] && git_status="$git_status_behind$git_status"
        fi

        
        if [[ -n $git_status ]]; then
            git_status=" [$git_status]"
        fi

        printf " \[\033[1m\]on \[\033[38;5;5m\]$branch$git_status\[\033[0m\]"
    fi
}