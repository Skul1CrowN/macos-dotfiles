#!/usr/bin/env bash

source "$CONFIG_DIR/variables.sh"

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ "$PERCENTAGE" = "" ]; then
	exit 0
fi

case ${PERCENTAGE} in
[8-9][0-9] | 100)
	ICON=""
  COLOR=$GREEN
	;;
[6-7][0-9])
	ICON=""
  COLOR=$YELLOW
	;;
[4-5][0-9])
	ICON=""
  COLOR=$YELLOW
	;;
[2-3][0-9])
	ICON=""
  COLOR=$ORANGE
	;;
[1][0-9])
	ICON=""
  COLOR=$RED
	;;
[0-9]) 
  ICON="" 
  COLOR=$RED
  ;;
esac

if [ "$CHARGING" != "" ]; then
	ICON=""
fi

sketchybar --set "$NAME" \
  icon="$ICON" \
  label="${PERCENTAGE}%" \
	icon.color="$COLOR" \
	label.color="$COLOR" \
	background.border_color="$COLOR" \
	background.color="$BAR_COLOR"