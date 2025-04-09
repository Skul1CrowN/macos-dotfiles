#!/usr/bin/env bash

COLOR="$AQUA"

volume=(
  padding_left=5
  icon.padding_left=15
  icon.padding_right=5
  icon.color="$COLOR"
  icon.align=left
  label.padding_left=5
  label.padding_right=15
  label.align=right
  label.color="$COLOR"
  background.border_color="$COLOR"
  background.color="$BAR_COLOR"
  background.drawing=on
  click_script="$PLUGIN_DIR/volume-click.sh"
	script="$PLUGIN_DIR/volume.sh"
)

sketchybar --add item volume right \
	--set volume "${volume[@]}" \
  --subscribe volume volume_change