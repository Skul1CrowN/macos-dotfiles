#!/usr/bin/env sh

toggle_mute() {
  sketchybar --set "$NAME" popup.drawing=off

  MUTED=$(osascript -e 'output muted of (get volume settings)')

  if [ "$MUTED" = "false" ]; then
    osascript -e 'set volume output muted true'
  else
    osascript -e 'set volume output muted false'
  fi
  exit 0
}

toggle_mute