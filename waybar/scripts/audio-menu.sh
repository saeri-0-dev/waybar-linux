#!/bin/bash

choice=$(printf "  Volume control\n  Input devices\n  Output devices\n  Mute / Unmute\n  Close" | \
wofi --dmenu --prompt "Sound")

case "$choice" in
  *"Volume control"*) pavucontrol ;;
  *"Input devices"*) pavucontrol -t 4 ;;
  *"Output devices"*) pavucontrol -t 3 ;;
  *"Mute"*) pactl set-sink-mute @DEFAULT_SINK@ toggle ;;
esac
