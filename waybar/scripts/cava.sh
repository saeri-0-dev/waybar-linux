#!/bin/bash

CONFIG="/tmp/waybar-cava.conf"

SINK=$(pactl get-default-sink)
SOURCE="${SINK}.monitor"

cat > "$CONFIG" <<EOF
[general]
bars = 20
framerate = 18

[input]
method = pulse
source = $SOURCE

[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 7
EOF

cava -p "$CONFIG" 2>/dev/null | while IFS= read -r line; do
    line="${line//;/ }"
    out=""

    for value in $line; do
        case "$value" in
            0) out="${out}▁" ;;
            1) out="${out}▂" ;;
            2) out="${out}▃" ;;
            3) out="${out}▄" ;;
            4) out="${out}▅" ;;
            5) out="${out}▆" ;;
            6) out="${out}▇" ;;
            7) out="${out}█" ;;
            *) out="${out}▁" ;;
        esac
    done

    echo "$out"
done
