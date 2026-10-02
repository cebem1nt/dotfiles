#!/usr/bin/env bash

# Disables caffeine when power-saver mode
# Sets keyboard brightness to 0 when power-saver 

CAFFEINE="$HOME/.local/bin/caffeine"
KEYBOARD_DEVICE="asus::kbd_backlight"

power_safe_actions() {
    "$CAFFEINE" --off &
    brightnessctl -d "$KEYBOARD_DEVICE" -s set 0 
}

power_normal_actions() {
    "$CAFFEINE" --on &

    brightnessctl -d "$KEYBOARD_DEVICE" -r        
    if [[ "$(brightnessctl -d $KEYBOARD_DEVICE g)" == "0" ]]; then
        brightnessctl -d "$KEYBOARD_DEVICE" set 1
    fi
}

if [[ $(powerprofilesctl get) == "power-saver" ]] ; then
    power_safe_actions
else
    power_normal_actions
fi

gdbus monitor \
    --system \
    --dest net.hadess.PowerProfiles \
    --object-path /net/hadess/PowerProfiles |
while IFS= read -r LINE; do
    case "$LINE" in
        *"PropertiesChanged"* )

        PROFILE=$(printf "%s\n" "$LINE" | awk -F"<'|'>" '/ActiveProfile/{print $2}')
        
        if [[ "$PROFILE" == "power-saver" ]]; then 
            power_safe_actions
        else
            power_normal_actions
        fi
        ;;
    esac
done
