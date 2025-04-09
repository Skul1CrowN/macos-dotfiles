#!/usr/bin/env bash

COLOR="$RED"

sketchybar --add event aerospace_workspace_change

for sid in $(aerospace list-workspaces --all); do
  sketchybar --add item space.$sid left \
    --subscribe space.$sid aerospace_workspace_change \
    --set space.$sid \
    icon="${SPACE_ICONS[$((sid - 1))]}" \
    label.drawing=off \
    icon.padding_right=15 \
    background.padding_left=15 \
		click_script="aerospace workspace $sid 2>/dev/null" \
		script="$PLUGIN_DIR/space.sh $sid"
done

sketchybar --add bracket spaces '/space.*/' \
	--set spaces \
	background.border_color="$COLOR" \
	background.color="$BAR_COLOR"

sketchybar --add item separator left \
  --set separator \
  background.padding_left=5 \
  background.padding_right=5 \
  label.drawing=off \
  icon.drawing=off \
