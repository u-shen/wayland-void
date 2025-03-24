#!/bin/sh
#==========================#
# Background Daemon:       #
#==========================#
killall wbg;wbg ~/Pictures/pix/wallpapers/GROOVE.png &
#==========================#
#  App Daemon              #
#==========================#
killall mako; mako &
killall udiskie;udiskie &
killall pipewire;pipewire &
killall pipewire-pulse;pipewire-pulse &
