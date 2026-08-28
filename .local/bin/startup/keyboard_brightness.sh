#!/bin/bash

BATTERY_STATUS=$(cat /sys/class/power_supply/BAT0/status)
KEYBOARD_DEVICE="asus::kbd_backlight"

if [[ "$BATTERY_STATUS" == "Discharging" ]]; then
    brightnessctl -d "$KEYBOARD_DEVICE" -s set 0
else
    brightnessctl -d "$KEYBOARD_DEVICE" -r
    
    if [[ "$(brightnessctl -d $KEYBOARD_DEVICE g)" == "0" ]]; then
        brightnessctl -d "$KEYBOARD_DEVICE" set 1
    fi
fi

