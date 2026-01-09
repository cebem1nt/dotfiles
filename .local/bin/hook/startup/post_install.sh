#!/bin/bash

if [[ ! $(which swww) ]]; then
    notify-send 'Error: swww is not installed!' "Please install it with your package manager" \
        --icon="dialog-error" --app-name=$0

    exit 1
fi

DEFAULT_WALLPAPER="$HOME/media/pictures/wallpapers/rain_road_tree_foggy_bush_flowers_girl_umbrela_grey_outside_mountain.jpg"

swww img $DEFAULT_WALLPAPER

notify-send "Generating thumbnails for wallpapers" "Please wait..." \
    --icon="preferences-desktop-wallpaper" --app-name=$0

python3 $SCRIPTS/auto_walls/rofi_selector.py --gen-thumbnails

notify-send "Thumbnails were generated!" \
    --icon="preferences-desktop-wallpaper" --app-name=$0

# Self destroy
rm $SCRIPTS/hook/startup/post_install.sh