#!/bin/bash

if [[ "$("$HOME"/.local/bin/themesw --current)" == "light" ]]; then 
    echo true
else 
    echo false 
fi
