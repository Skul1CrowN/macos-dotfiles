#!/usr/bin/env bash

COLOR="$WHITE"

icon=(
  icon=""
  background.drawing=on
  label.drawing=off
  icon.padding_left=10
  icon.padding_right=10
)

text=(
  label.color="$COLOR"
  label.padding_right=10
  icon.drawing=off
  script="$PLUGIN_DIR/front_app.sh"
)

sketchybar --add item front_app.icon left \
            --set front_app.icon "${icon[@]}" \
            --add item front_app.text left \
            --set front_app.text "${text[@]}" \
            --subscribe front_app.text front_app_switched

sketchybar --add bracket front_app '/front_app.*/' \
            --set front_app \
            background.color="$BAR_COLOR" \
            background.border_color="$COLOR"