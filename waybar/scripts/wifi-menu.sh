#!/bin/bash

CHOICE=$(nmcli -t -f SSID,SIGNAL,SECURITY dev wifi list | awk -F: '!seen[$1]++ && $1 != "" {print $1 "  " $2 "%  " $3}' | wofi --dmenu --prompt "Wi-Fi networks")

SSID=$(echo "$CHOICE" | awk '{print $1}')

[ -z "$SSID" ] && exit 0

nmcli dev wifi connect "$SSID" || \
PASS=$(wofi --dmenu --password --prompt "Password for $SSID") && nmcli dev wifi connect "$SSID" password "$PASS"
