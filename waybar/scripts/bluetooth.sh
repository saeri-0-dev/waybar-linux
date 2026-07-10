#!/bin/bash

status=$(bluetoothctl show 2>/dev/null)

case "$status" in
  *"Powered: yes"*)
    echo ""
    ;;
  *)
    echo ""
    ;;
esac
