#!/bin/bash

battery_status=$(cat /sys/class/power_supply/BAT0/status)
current_profile=$(asusctl profile -p | grep -i "Active profile is")

if [[ "$battery_status" == "Discharging" && "$current_profile" != *"Quiet" ]]; then
    notify-send "Setting Quiet mode..." -i asus_notif_yellow
    asusctl profile -P Quiet
elif [[ "$battery_status" != "Discharging" && "$current_profile" == *"Quiet" ]]; then
    notify-send "Setting Balanced mode..." -i asus_notif_white
    asusctl profile -P Balanced
fi
