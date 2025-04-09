#!/usr/bin/env bash

COLOR="$MAGENTA"

clock=(
	update_freq=10
	padding_left=5
	icon.color="$COLOR"
	icon=""
	icon.padding_left=10
	icon.padding_right=5
	label.color="$COLOR"
	label.padding_right=10
	background.border_color="$COLOR"
	background.color="$BAR_COLOR"
	background.drawing=on
	script="$PLUGIN_DIR/clock.sh"
)

sketchybar --add item clock right \
	--set clock "${clock[@]}"