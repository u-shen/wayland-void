#!/bin/bash
screenshot_all_displays="DISPLAY"
screenshot_area_of_display="REGION"
screenshot_area_and_edit="EDITOR"
# Store each option in a single string seperated by newlines.
options=$(printf "$screenshot_all_displays\n$screenshot_area_of_display\n$screenshot_area_and_edit\n")
# Prompt the user with wmenu
choice="$(echo -e "$options" | wmenu -il 3 -f "JetBrains Mono Nerd Font 12" -p "SCREENSHOOT MENU: " -N 1d2021 -n ebdbb2 -M 689d6a -m 1d2021 -S 689d6a -s 1d2021)"

case $choice in
    $screenshot_all_displays)
        grim $(xdg-user-dir PICTURES)/screenshots/$(date +'%F_%H:%M:%S_GRIM.png') && notify-send -h int:value:100  "DONE SCREENSHOOT ALL DISPLAY TOOKEN"
        ;;
    $screenshot_area_of_display)
        grim -g "$(slurp)" $(xdg-user-dir PICTURES)/screenshots/$(date +'%F_%H:%M:%S_GRIM_AREA.png') && notify-send -h int:value:100 "DONE SCREENSHOOT REGION OF DISPLAY TOOKEN"
        ;;
    $screenshot_area_and_edit)
        grim -g "$(slurp)" - | swappy -f - && notify-send -h int:value:100 "NOTION AREA TOKEN"
        ;;
	*) exit 1 ;;
esac
