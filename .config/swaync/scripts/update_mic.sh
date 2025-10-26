#!/bin/bash

if pactl get-source-mute @DEFAULT_SOURCE@ | grep -q "Mute: yes";
    then
        echo true
    else
        echo false
fi