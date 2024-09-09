#!/bin/bash

STATE_FILE="$HOME/.config/hypr/scripts/touchpad_state"
# can be obtained with "hyprctl devices"
DEVICE_NAME="asue140d:00-04f3:31b9-touchpad"

set_touchpad_state() {
    if [ "$(cat "$STATE_FILE")" = "0" ]; then
	enabled=0
    else
	enabled=1
    fi
	hyprctl -r -- keyword device[$DEVICE_NAME]:enabled $enabled > /dev/null
}

toggle_touchpad_state() {
    if [ "$(cat "$STATE_FILE")" = "0" ]; then
	echo "1" > "$STATE_FILE"
    else
	echo "0" > "$STATE_FILE"
    fi
    set_touchpad_state
}

if [ $# -eq 0 ]; then
    toggle_touchpad_state
else
    set_touchpad_state
fi

