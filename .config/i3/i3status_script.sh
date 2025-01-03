#!/bin/bash
i3status | while :
do
 read line
    # Отримуємо поточну розкладку
    LAYOUT=$(xkblayout-state print "%s")
    # Додаємо розкладку до рядка статусу
    echo "$line $LAYOUT |" || exit 1
done
