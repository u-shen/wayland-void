#!/bin/bash

options=$(printf "POWER OFF\nREBOOT\nSLEEP\nHIBERNATE\nLOCK\nLOG OUT")

selected=$(echo -e "$options" | wmenu -il 6 -f "MapleMono NF 11" -p "POWER MENU: " -N 0d0e0f -n ebdbb2 -M 689d6a -m 1d2021 -S 689d6a -s 0d0e0f)

case "$selected" in
"POWER OFF") doas poweroff ;;
"REBOOT") doas reboot ;;
"SLEEP") doas zzz ;;
"HIBERNATE") doas zzz ;;
"LOCK") swaylock ;;
"LOG OUT") pkill dwl ;;
*) exit 1 ;;
esac
