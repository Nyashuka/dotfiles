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

    LEFT_TO_DISCHARGE=""
    if [ "$(cat /sys/class/power_supply/BAT1/status)" == "Discharging" ]; then
	    LEFT_TO_DISCHARGE="($(upower -i $(upower -e | grep 'battery') | grep 'time to empty' | awk '{print $4, $5}'))"
    fi

    echo "$line  $CPUTEMP°C   $SOUNDVOLUME%  󱊣$BATTERY%$LEFT_TO_DISCHARGE  󰌌 $LAYOUT | $TIME " || exit 1
    sleep 1
done
