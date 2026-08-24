#!/bin/bash
# Apply some settings based on currently running compositor.
# Example: if we're running mango, setup waybar to use mango specific configs

IS_MANGO=0 # Assume we're on hyprland

if [[ "$MANGO_INSTANCE_SIGNATURE" ]]; then
    IS_MANGO=1
fi

cd ~/.config/waybar

if [[ $IS_MANGO == 1 ]]; then
    ln -fs modules.mango.jsonc modules.jsonc
else
    ln -fs modules.hyprland.jsonc modules.jsonc
fi