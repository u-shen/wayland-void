#!/bin/sh
# =============================================================================== #
# Background Daemon:                                                              #
# =============================================================================== #
killall wbg;wbg ~/Pictures/pix/wallpapers/EVERBLUSH.png
# =============================================================================== #
#  App Daemon                                                                     #
# =============================================================================== #
killall mako; mako &
killall udiskie;udiskie &
killall pipewire;pipewire &
killall pipewire-pulse;pipewire-pulse &
