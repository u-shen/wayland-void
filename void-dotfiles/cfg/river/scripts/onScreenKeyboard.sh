#!/bin/sh
# =============================================================================== #
# My On Screen Keyboard:                                                          #
# =============================================================================== #
pkill wvkbd || wvkbd-mobintl -l arabic --landscape-layers arabic \
    -H 200 -L 200 --fn "JetBrainsMono NF 10" \
    --bg 1F1F1Fff --fg 151515ff --text E8E3E3ff --fg-sp 1F1F1Fff --press 151515ff
