#!/usr/bin/env bash

battery=(
  update_freq=60
  padding_left=5
  icon.align=center
  icon.align=left
  icon.padding_left=15
  icon.padding_right=5
  label.padding_left=5
  label.padding_right=15
  label.align=right
  background.drawing=on
	script="$PLUGIN_DIR/battery.sh"
)

sketchybar --add item battery right \
	--set battery "${battery[@]}" \
  --subscribe battery power_source_change system_woke