#!/bin/bash

THEMESW_DIR="$HOME/.config/themesw"
THEMESW_CURENT="$THEMESW_DIR/current"


if [[ -f "$THEMESW_CURENT" ]]; then
    SCHEME=$(<"$THEMESW_CURENT") 

    echo "$1" > "$THEMESW_DIR/wallpaper.last.$SCHEME" 
fi

awww img "$1"
