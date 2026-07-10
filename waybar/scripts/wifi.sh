#!/bin/bash

IFACE=$(iw dev | awk '$1=="Interface"{print $2}')

SSID=$(iw dev "$IFACE" link | grep SSID | cut -d' ' -f2-)
SIGNAL=$(iw dev "$IFACE" link | grep signal | awk '{print $2}')

if [ -z "$SSID" ]; then
    echo '{"text":"󰤮","tooltip":"Wi-Fi disconnected","class":"disconnected"}'
else
    if [ "$SIGNAL" -ge -50 ]; then ICON="󰤨"
    elif [ "$SIGNAL" -ge -60 ]; then ICON="󰤥"
    elif [ "$SIGNAL" -ge -70 ]; then ICON="󰤢"
    elif [ "$SIGNAL" -ge -80 ]; then ICON="󰤟"
    else ICON="󰤯"
    fi

    echo "{\"text\":\"$ICON\",\"tooltip\":\"$SSID ($SIGNAL dBm)\",\"class\":\"connected\"}"
fi
