#!/usr/bin/env bash

network=(
  icon.align=center
  icon.padding_left=10
  icon.padding_right=10
  icon.width=40
  label.padding_right=10
  label.width=0
	background.color="$BAR_COLOR"
	script="$PLUGIN_DIR/network.sh"
)

sketchybar --add item network right \
	--set network "${network[@]}" \
  --subscribe network wifi_change mouse.entered mouse.exited