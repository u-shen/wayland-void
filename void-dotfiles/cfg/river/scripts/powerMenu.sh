#!/bin/bash
# =============================================================================== #
# Power Menu:                                                                     #
# =============================================================================== #
options=$(printf "POWER OFF\nREBOOT\nSUSPEND\nHIBERNATE\nLOCK\nLOG OUT")

selected=$(echo -e "$options" | wmenu -il 6 -f "JetBrainsMono NF 10" -p "POWER MENU: " -N 141b1e -n dadada -M 8ccf7e -m 232a2d -S 8ccf7e -s 141b1e)

case "$selected" in
	"POWER OFF") doas poweroff ;;
	"REBOOT") doas reboot ;;
	"SUSPEND") doas zzz ;;
	"HIBERNATE") doas zzz ;;
	"LOCK") swaylock ;;
	"LOG OUT") riverctl exit ;;
	*) exit 1 ;;
esac
