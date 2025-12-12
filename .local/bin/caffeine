#!/bin/bash

if [[ -n $1 ]]; then
    WHAT="$1"
else
    WHAT="idle"
fi

if pgrep -f "systemd-inhibit --what=$WHAT sleep infinity" > /dev/null; 
    then
        notify-send "Disabling preventing..." "Disabling inhibiting for $WHAT" -i caffeine-cup-empty -a caffeine
        pkill -f "systemd-inhibit --what=$WHAT sleep infinity"
    else 
        notify-send "Preventing sleep..." "Enabled inhibiting for $WHAT" -i caffeine-cup-full -a caffeine
        systemd-inhibit --what=$WHAT sleep infinity
fi
