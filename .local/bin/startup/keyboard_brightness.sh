#!/bin/bash

BATTERY_STATUS=$(cat /sys/class/power_supply/BAT0/status)
KEYBOARD_DEVICE="asus::kbd_backlight"

if [[ "$BATTERY_STATUS" == "Discharging" ]]; then
    brightnessctl -d "$KEYBOARD_DEVICE" -s set 0
else
    brightnessctl -d "$KEYBOARD_DEVICE" -r 
fi
