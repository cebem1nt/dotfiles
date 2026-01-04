#!/bin/bash

LAST_DEVICE=$(bluetoothctl devices Paired | grep "Device" | tail -n 1)
MAC=${LAST_DEVICE:7:17} 

# Check if a device was not found
if [ -z "$MAC" ]; then
    cleanup $1
fi

IS_CONNECTED=$(bluetoothctl info $MAC | grep Connected:)

IFS="$MAC" read -ra elements <<< "$LAST_DEVICE"
DEVICE_NAME=$(echo "${elements[-1]}" | sed 's/^[ \t]*//')

if [[ $IS_CONNECTED == *"yes" ]]; then
    exit 1
fi

cleanup() {
    if [[ "$1" == "--no-cleanup" ]]; then
        exit 0
    fi

    playerctl pause
    bluetoothctl power off
    rfkill block bluetooth
    exit 1
}

rfkill unblock bluetooth
sleep 1

bluetoothctl power on
bluetoothctl connect "$MAC"

# Check if the connection was not successful
if [ $? -ne 0 ]; then
    cleanup $1
fi

notify-send --icon=bluetooth \
            --app-name=bluetooth \
            "Connection successful" "Connected to \"$DEVICE_NAME\"" 
