# Various shell commands I find useful


# Create a file with the MIT license
# Depends: curl, jq
curl -s https://api.github.com/licenses/mit | jq -r '.body'| >> LICENSE

# Kill a port running in the background
lsof -t -i:3000 | xargs kill

# Minimize spotifym, when it starts in fullscreen and hides the taskbar
wmctrl -r spotify -b toggle,fullscreen
