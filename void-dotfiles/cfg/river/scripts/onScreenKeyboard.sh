#!/bin/sh
# =============================================================================== #
# My On Screen Keyboard:                                                          #
# =============================================================================== #
pkill wvkbd || wvkbd-mobintl -l arabic --landscape-layers arabic \
    -H 200 -L 200 --fn "JetBrainsMono NF 10" \
    --bg 232a2d  --fg 141b1e --text dadada --fg-sp 232a2d --press 141b1e
