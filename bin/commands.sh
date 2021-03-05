# Various shell commands I find useful


# Create a file with the MIT license
# Depends: curl, jq
curl -s https://api.github.com/licenses/mit | jq -r '.body'| >> LICENSE

# Kill a port running in the background
lsof -t -i:3000 | xargs kill

# Minimize spotifym, when it starts in fullscreen and hides the taskbar
wmctrl -r spotify -b toggle,fullscreen

# List all manually-installed debian packages without dependencies
# Source: https://unix.stackexchange.com/a/468369
apt-mark showmanual | sort | grep -v -F -f <(apt show $(apt-mark showmanual) 2> /dev/null | grep -e ^Depends -e ^Pre-Depends | sed 's/^Depends: //; s/^Pre-Depends: //; s/(.*)//g; s/:any//g' | tr -d ',|' | tr ' ' '\n' | grep -v ^$ | sort -u)
