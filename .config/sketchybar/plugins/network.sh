#!/usr/bin/env bash

source "$CONFIG_DIR/variables.sh"
update_ip() {
  # Get the active network interface (the one with default route)
  ACTIVE_INTERFACE=$(route -n get default | grep interface | awk '{print $2}')
  if [ -z "$ACTIVE_INTERFACE" ]; then
    COLOR="$GREY"
    WIFI_SSID="Disconnected"
    ICON="󰖪"
  else
    COLOR="$GREEN"
    WIFI_SSID=$(ipconfig getsummary "$(networksetup -listallhardwareports | awk '/Wi-Fi|AirPort/{getline; print $NF}')" | grep '  SSID : ' | awk -F ': ' '{print $2}')
    ICON="󰖩"
  fi

  # Update the sketchybar item
  sketchybar --set "$NAME" \
    icon="$ICON" \
    icon.color="$COLOR" \
    background.border_color="$COLOR"
}

mouse_entered() {
  sketchybar \
    --animate tanh 30 \
    --set "$NAME" \
    label.color=$COLOR \
    label="$WIFI_SSID" \
    label.width=$((${#WIFI_SSID} * 8 + 10))
}

mouse_exited() {
  sketchybar \
    --animate tanh 30 \
    --set "$NAME" \
    label.width=0
}

# Main logic for sketchybar events
case "$SENDER" in
"wifi_change") update_ip ;;
"routine") update_ip ;;
"forced") update_ip ;;
"mouse.entered") update_ip; mouse_entered ;;
"mouse.exited") update_ip; mouse_exited ;;
*) update_ip ;;
esac