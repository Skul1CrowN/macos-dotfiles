#!/usr/bin/env bash

COLOR="$BLUE"

calendar=(
	update_freq=10
	padding_left=5
	icon=""
	icon.color="$COLOR"
	icon.padding_left=10
	icon.padding_right=5
	label.padding_right=10
	label.color="$COLOR"
	background.border_color="$COLOR"
	background.color="$BAR_COLOR"
	background.drawing=on \
	script="$PLUGIN_DIR/calendar.sh"
)

sketchybar --add item calendar right \
	--set calendar "${calendar[@]}"