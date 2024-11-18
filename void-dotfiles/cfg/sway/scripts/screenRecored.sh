#!/bin/bash
recorder_all="DISPLAY"
recorder_area="REGION"

# Store each option in a single string seperated by newlines.
options=$(printf "$recorder_all\n$recorder_area")

# Prompt the user with fuzzel
choice="$(echo -e "$options" | wmenu -il 2 -f "Maple Mono NF 11" -p "RECORDE MENU: " -N 0d0e0f -n ebdbb2 -M 689d6a -m 1d2021 -S 689d6a -s 0d0e0f)"

case $choice in
    $recorder_all)
        wf-recorder --audio --file=$(xdg-user-dir VIDEOS)/$(date +'%F_%H:%M:%S_REC.mp4') && notify-send -h int:value:100 "DONE RECEORDER ALL DISPLAY"
        ;;
    $recorder_area)
        wf-recorder -g "$(slurp)" --audio --file=$(xdg-user-dir VIDEOS)/$(date +'%F_%H:%M:%S_REC_AREA.mp4') && notify-send -h int:value:100 "DONE RECEORDER REGION OF DISPLAY"
        ;;
esac
