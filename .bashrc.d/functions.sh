###
# Functions
###

# Play a notification sound
mksound() {
  # the `${}` syntax provides a default value for `$1`
  paplay "/usr/share/sounds/freedesktop/stereo/${1:-"message"}.oga"
}

# Show a notification after a set duration
timer() {
  if [ -z $1 ]; then
    # no params, show help
    printf "Usage: timer <seconds> [title]\n"
  else
    sleep $1 && mksound & zenity --info --icon-name="time" --text="${2:-Time\'s up!}";
  fi
}

mit() {
  if [ -f ~/.local/bin/license ]; then
    cat ~/.local/bin/license
  else
    lic=$(curl -s https://api.github.com/licenses/mit | jq -r '.body')
    echo $lic | sed -e "s/\[year\]/`date +%Y`/" -e "s/\[fullname\]/Binyamin Aron Green/"
  fi
}

# ex - archive extractor
# usage: ex <file>
ex() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
