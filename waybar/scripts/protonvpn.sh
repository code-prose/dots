#!/bin/bash
# ProtonVPN status/toggle for waybar's custom module.
# No args: print JSON status for waybar to poll.
# --toggle: connect (default: Switzerland) if disconnected, disconnect if connected.

status_output=$(protonvpn status 2>/dev/null | grep -E '^(Status|Server|Load|Protocol):')
state=$(echo "$status_output" | awk -F': ' '/^Status:/ {print $2}')

if [ "$1" = "--toggle" ]; then
    if [ "$state" = "Connected" ]; then
        protonvpn disconnect >/dev/null 2>&1
    else
        protonvpn connect --country CH >/dev/null 2>&1
    fi
    pkill -RTMIN+8 waybar
    exit 0
fi

if [ "$state" = "Connected" ]; then
    server=$(echo "$status_output" | awk -F': ' '/^Server:/ {print $2}' | cut -d'#' -f1)
    tooltip=$(echo "$status_output" | sed ':a;N;$!ba;s/\n/\\n/g')
    printf '{"text": "  %s", "tooltip": "%s", "class": "connected", "alt": "connected"}\n' \
        "$server" "$tooltip"
else
    printf '{"text": "  off", "tooltip": "ProtonVPN: Disconnected\\nClick to connect (Switzerland)", "class": "disconnected", "alt": "disconnected"}\n'
fi
