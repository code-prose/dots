#!/bin/bash
# khal agenda for waybar's custom module.
# No args: print JSON of next upcoming event + a short agenda tooltip.

raw=$(khal list now 30d 2>/dev/null)

if [ -z "$raw" ]; then
    text="No upcoming events"
else
    next=$(echo "$raw" | awk '
        /^[A-Za-z]+, [0-9]{4}-[0-9]{2}-[0-9]{2}$/ { hdr = $0; next }
        {
            split(hdr, parts, ", ")
            cmd = "date -d " parts[2] " +\"%b %d\""
            cmd | getline short
            close(cmd)
            gsub(/^ +/, "")
            print short " " $0
            exit
        }
    ')
    text="$next"
fi

tooltip=$(echo "$raw" | sed ':a;N;$!ba;s/\n/\\n/g' | sed 's/"/\\"/g')
[ -z "$raw" ] && tooltip="No events in the next 30 days"

printf '{"text": "  %s", "tooltip": "%s"}\n' "$text" "$tooltip"
