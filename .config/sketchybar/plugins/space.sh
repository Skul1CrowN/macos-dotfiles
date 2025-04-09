#!/usr/bin/env bash

source "$CONFIG_DIR/variables.sh"

FOCUSED_COLOR="$RED"
COLOR="$GREY"

if [ "$1" = $FOCUSED_WORKSPACE ]; then
	sketchybar --set "$NAME" \
		icon.color="$FOCUSED_COLOR"
else
	sketchybar --set "$NAME" \
		icon.color="$COLOR"
fi