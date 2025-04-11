#!/bin/sh
# =============================================================================== #
# My On Screen Keyboard:                                                          #
# =============================================================================== #
pkill wvkbd || wvkbd-mobintl -l arabic --landscape-layers arabic \
    -H 200 -L 200 --fn "JetBrainsMono NF 10" \
    --bg 2d3437ff --fg 141b1eff --text dadadaff --fg-sp 232a2dff --press 141b1eff
