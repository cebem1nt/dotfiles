#!/usr/bin/env bash

ACTION=""   # "on", "off", or empty (toggle)
WHAT="idle"

for arg in "$@"; do
    case "$arg" in
        --on) ACTION="on" ;;
        --off) ACTION="off" ;;
        --help|-h)
            echo "Usage: $0 [--on|--off] [what]"
            exit 0
        ;;
        *) WHAT="$arg" ;;
    esac
done

GREP="systemd-inhibit --what=${WHAT} sleep infinity"

is_running() { 
    pgrep -f -- "$GREP" > /dev/null 2>&1; 
}

start() {
    if is_running; then
        return
    fi

    notify-send  -i caffeine-cup-full -a caffeine \
        "Preventing sleep..." "Enabled inhibiting for $WHAT"

    nohup bash -c "$GREP" >/dev/null 2>&1 &
}

stop() {
    if ! is_running; then
        return
    fi

    notify-send  -i caffeine-cup-empty -a caffeine \
        "Disabling preventing..." "Disabling inhibiting for $WHAT"

    pkill -f -- "$GREP"
}

if [[ "$ACTION" == "on" ]]; then
    start
elif [[ "$ACTION" == "off" ]]; then
    stop
else
    if is_running; then stop; else start; fi
fi
