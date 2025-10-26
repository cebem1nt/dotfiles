#!/bin/bash

if pgrep -f "systemd-inhibit --what=idle sleep infinity" > /dev/null; 
    then 
        echo true
    else 
        echo false
fi
