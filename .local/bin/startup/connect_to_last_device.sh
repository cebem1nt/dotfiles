#!/bin/bash
# Connect to the last / preferred bluetooth device at startup
# If could not, turn bluetooth off

cleanup() {
    bluetoothctl power off
    rfkill block bluetooth
    exit
}

if [[ ! -z "$BLUETOOTH_PREFERRED_DEV" ]]; then
    MAC=$BLUETOOTH_PREFERRED_DEV
elif [[ -e "$HOME/.config/.bluetooth.pref" ]]; then
    MAC=$(<"$HOME/.config/.bluetooth.pref")
else 
    LAST_DEVICE=$(bluetoothctl devices Paired | grep "Device" | head -n 1)
    MAC=${LAST_DEVICE:7:17} 
fi

if [[ -z "$MAC" ]]; then
    cleanup
fi

rfkill unblock bluetooth
sleep 1

bluetoothctl power on
bluetoothctl connect "$MAC"

if [[ $? -ne 0 ]]; then
    cleanup
fi

DEVICE_NAME=$(bluetoothctl info "$MAC" | sed -n 's/^[[:space:]]*Alias:[[:space:]]*//p')

notify-send --icon=bluetooth \
            --app-name=bluetooth \
            "Connection successful" "Connected to \"$DEVICE_NAME\"" 
