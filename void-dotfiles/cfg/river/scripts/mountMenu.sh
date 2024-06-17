#!/usr/bin/sh
# mount, unmount and poweroff usb drives through dmenu with udisksctl
# inspired by dmenu-udevil
notify-send -h int:value:100 "Getting List Of Available USB..."
DEV_LABEL="/dev/disk/by-label/"

label="$(find $DEV_LABEL* | cut -d'/' -f5 | wmenu -il 3 -f "JetBrains Mono Nerd Font 12" -N 1d2021 -n ebdbb2 -M 689d6a -m 1d2021 -S 689d6a -s 1d2021 -p "MOUNT MENU: ")"
path="$DEV_LABEL$label"
[[ -z $label ]] && echo "Cancelled." && exit

action=$(echo -e "MOUNT\nUNMOUNT\nPOWEROFF" | wmenu -il 3 -f "JetBrains Mono Nerd Font 12" -N 1d2021 -n ebdbb2 -M 689d6a -m 1d2021 -S 689d6a -s 1d2021  -p "$label:")
[[ -z $action ]] && echo "Cancelled." && exit
[[ $action = MOUNT ]] && action=mount
[[ $action = UNMOUNT ]] && action=unmount
[[ $action = POWEROFF ]] && action=power-off
udisksctl "$action" -b "$path" 2>&1 | xargs -0 notify-send
