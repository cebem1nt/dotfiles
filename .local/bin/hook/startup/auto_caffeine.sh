#!/usr/bin/env bash

CAFFEINE="$HOME/.local/bin/caffeine"

if [[ $(powerprofilesctl get) != "power-saver" ]] ; then
    "$CAFFEINE" --on & 
fi

gdbus monitor \
    --system \
    --dest net.hadess.PowerProfiles \
    --object-path /net/hadess/PowerProfiles |
while IFS= read -r line; do
    case "$line" in
        *"PropertiesChanged"* )

        profile=$(printf "%s\n" "$line" | awk -F"<'|'>" '/ActiveProfile/{print $2}')
        
        if [[ "$profile" == "power-saver" ]]; then 
            "$CAFFEINE" --off &
        else
            "$CAFFEINE" --on &
        fi
        ;;
    esac
done
