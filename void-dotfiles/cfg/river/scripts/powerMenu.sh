#!/bin/bash
# =============================================================================== #
# Power Menu:                                                                     #
# =============================================================================== #
options=$(printf "POWER OFF\nREBOOT\nSUSPEND\nHIBERNATE\nLOCK\nLOG OUT")

selected=$(echo -e "$options" | wmenu -il 6 -f "JetBrainsMono NF 10" -p "POWER MENU: " -N 151515 -n dadada -M 8C977D -m 1F1F1F -S 8C977D -s 151515)

case "$selected" in
	"POWER OFF") doas poweroff ;;
	"REBOOT") doas reboot ;;
	"SUSPEND") doas zzz ;;
	"HIBERNATE") doas zzz ;;
	"LOCK") swaylock ;;
	"LOG OUT") riverctl exit ;;
	*) exit 1 ;;
esac
