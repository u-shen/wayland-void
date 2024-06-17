#!/bin/sh
#==========================#
# Background Daemon:       #
#==========================#
wbg ~/pix/wallpapers/WITCHER.png &
#==========================#
#  App Daemon              #
#==========================#
fnott &
udiskie &
nm-applet &
blueman-applet &
pipewire &
pipewire-pulse &
