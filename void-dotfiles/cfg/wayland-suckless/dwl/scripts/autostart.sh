#!/bin/sh
#==========================#
# Background Daemon:       #
#==========================#
wbg ~/pix/wallpapers/WITCHER.png &
#==========================#
#  App Daemon              #
#==========================#
swaync &
udiskie &
nm-applet &
pipewire &
pipewire-pulse &
