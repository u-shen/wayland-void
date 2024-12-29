#!/bin/bash

options=$(printf "POWER OFF\nREBOOT\nSUSPEND\nHIBERNATE\nLOCK\nLOG OUT")

selected=$(echo -e "$options" | wmenu -il 6 -f "JetBrainsMono NF 10" -p "POWER MENU: " -N 0d0e0f -n ebdbb2 -M 689d6a -m 1d2021 -S 689d6a -s 0d0e0f)

case "$selected" in
	"POWER OFF") doas poweroff ;;
	"REBOOT") doas reboot ;;
	"SLEEP") doas zzz ;;
	"HIBERNATE") doas zzz ;;
	"LOCK") swaylock ;;
	"LOG OUT") riverctl exit ;;
	*) exit 1 ;;
esac
