#!/bin/sh
#==========================#
# Background Daemon:       #
#==========================#
killall wbg;wbg ~/Pictures/pix/wallpapers/THE-WITCHER.png &
#==========================#
#  App Daemon              #
#==========================#
killall swaync; swaync &
killall udiskie;udiskie &
killall pipewire;pipewire &
killall pipewire-pulse;pipewire-pulse &
