#!/bin/sh
#==========================#
# My On Screen Keyboard:
#==========================#
pkill wvkbd || wvkbd-mobintl -l arabic --landscape-layers arabic \
    -H 200 -L 200 --fn "JetBrainsMono Nerd Font 14" \
    --bg 1d2021ff --fg 1d2021ff --text ebdbb2 --fg-sp 282828ff --press 282828ff

