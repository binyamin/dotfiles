function f_node {
    if ls $PWD/*.js >/dev/null 2>&1 || [[ -f $PWD/package.json || -d $PWD/node_modules ]]; then
        printf " \[\033[1m\]via \[\033[38;5;10m\]⬢ $(node -v 2>/dev/null)\[\033[0m\]"
    fi
}