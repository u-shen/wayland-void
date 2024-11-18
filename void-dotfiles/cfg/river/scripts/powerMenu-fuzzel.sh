#!/bin/bash

SELECTION="$(printf "1 - Lock\n2 - Sleep\n3 - Log out\n4 - Reboot\n5 - Reboot to UEFI\n6 - Hard reboot\n7 - Poweroff" | fuzzel --dmenu -l 7 -p "Power Menu: ")"

case $SELECTION in
*"Lock")
	swaylock
	;;
*"Sleep")
	doas zzz
	;;
*"Log out")
	riverctl exit
	;;
*"Reboot")
	doas reboot
	;;
*"Reboot to UEFI")
	doas reboot --firmware-setup
	;;
*"Hard reboot")
	doas reboot -f
	;;
*"Poweroff")
	doas poweroff
	;;
esac
