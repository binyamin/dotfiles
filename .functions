#!/bin/sh

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

reload_gtk_theme() {
  theme=$(gsettings get org.gnome.desktop.interface gtk-theme)
  gsettings set org.gnome.desktop.interface gtk-theme ''
  sleep 1
  gsettings set org.gnome.desktop.interface gtk-theme $theme
}

# List all manually-installed debian packages without dependencies
# Source: https://unix.stackexchange.com/a/468369
apt-manual() {
	apt-mark showmanual | sort | grep -v -F -f <(apt show $(apt-mark showmanual) 2> /dev/null | grep -e ^Depends -e ^Pre-Depends | sed 's/^Depends: //; s/^Pre-Depends: //; s/(.*)//g; s/:any//g' | tr -d ',|' | tr ' ' '\n' | grep -v ^$ | sort -u)

	# list=$(apt list --installed | sed 's#/.*##')
	# echo $list
}
