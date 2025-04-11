#!/bin/bash
# =============================================================================== #
# Screenshots Menu:                                                               #
# =============================================================================== #
screenshot_all_displays="DISPLAY"
screenshot_area_of_display="REGION"
screenshot_area_and_edit="EDITOR"
# Store each option in a single string seperated by newlines.
options=$(printf "$screenshot_all_displays\n$screenshot_area_of_display\n$screenshot_area_and_edit\n")
# Prompt the user with wmenu
choice="$(echo -e "$options" | wmenu -il 3 -f "JetBrainsMono NF 10" -p "SCREENSHOOT MENU: " -N 141b1e -n ebdbb2 -M 8ccf7e -m 232a2d -S 8ccf7e -s 141b1e)"

case $choice in
    $screenshot_all_displays)
        grim $(xdg-user-dir Pictures)/Pictures/pix/screenshots/$(date +'%F_%H:%M:%S_GRIM.png') && notify-send -h int:value:100  "DONE SCREENSHOOT ALL DISPLAY TOOKEN"
        ;;
    $screenshot_area_of_display)
        grim -g "$(slurp)" $(xdg-user-dir Pictures)/Pictures/pix/screenshots/$(date +'%F_%H:%M:%S_GRIM_AREA.png') && notify-send -h int:value:100 "DONE SCREENSHOOT REGION OF DISPLAY TOOKEN"
        ;;
    $screenshot_area_and_edit)
        grim -g "$(slurp)" - | swappy -f - && notify-send -h int:value:100 "NOTION AREA TOKEN"
        ;;
	*) exit 1 ;;
esac
