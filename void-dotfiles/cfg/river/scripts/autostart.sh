#!/bin/sh
# =============================================================================== #
# Background Daemon:                                                              #
# =============================================================================== #
killall wbg;wbg ~/Pictures/pix/wallpapers/kyrr.png &
# =============================================================================== #
#  App Daemon                                                                     #
# =============================================================================== #
killall pipewire-pulse;pipewire-pulse &
killall pipewire;pipewire &
killall udiskie;udiskie &
killall mako; mako &
