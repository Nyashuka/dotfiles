#!/bin/bash

TIMEZONE="Europe/Kyiv"

i3status | while :
do
 read line
    # Отримуємо поточну розкладку
    LAYOUT=$(xkblayout-state print "%s")
    BATTERY=$(cat /sys/class/power_supply/BAT1/capacity)
    TIME=$(TZ=$TIMEZONE date "+%A %d.%m.%Y %T")
    SOUNDVOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '\d+(?=%)' | head -n 1)
    CPUTEMP=$(($(cat /sys/devices/virtual/thermal/thermal_zone6/temp) / 1000))
    # Додаємо розкладку до рядка статусу
    echo "$line  $CPUTEMP°C   $SOUNDVOLUME%  󱊣$BATTERY%  󰌌 $LAYOUT | $TIME " || exit 1
    sleep 1
done
