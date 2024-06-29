#!/bin/sh
#==========================#
# Background Daemon:       #
#==========================#
killall wbg;wbg ~/pix/wallpapers/WITCHER.png &
#==========================#
#  App Daemon              #
#==========================#
killall waybar;waybar &
killall swaync; swaync &
killall udiskie;udiskie &
killall nm-applet;nm-applet &
killall pipewire;pipewire &
killall pipewire-pulse;pipewire-pulse &
