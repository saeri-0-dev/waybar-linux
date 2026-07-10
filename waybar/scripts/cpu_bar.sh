#!/bin/bash

make_bar() {
    value=$1
    blocks=16
    filled=$((value * blocks / 100))
    empty=$((blocks - filled))

    printf "%0.s:" $(seq 1 $filled)
    printf "%0.s-" $(seq 1 $empty)
}

cpu=$(top -bn1 | awk '/Cpu/ {print int(100 - $8)}')
ram=$(free | awk '/Mem:/ {print int($3/$2 * 100)}')

echo "{\"text\": \"CPU $(make_bar $cpu) ${cpu}%\\nRAM $(make_bar $ram) ${ram}%\"}"
