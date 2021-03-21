#!/bin/sh

# Play a notification sound
mksound() {
  # the `${}` syntax provides a default value for `$1`
  paplay "/usr/share/sounds/freedesktop/stereo/${1:-"message"}.oga"
}
