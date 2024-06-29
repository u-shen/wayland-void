#!/bin/sh
#==========================#
# My On Screen Keyboard:
#==========================#
pkill wvkbd || wvkbd-mobintl -l arabic --landscape-layers arabic \
    -H 200 -L 200 --fn "Maple Mono NF 11" \
    --bg 000000ff --fg 0d0e0fff --text ebdbb2ff --fg-sp 141617ff --press 1b1b1bff

