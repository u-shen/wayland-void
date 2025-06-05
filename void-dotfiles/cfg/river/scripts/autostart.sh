#!/bin/sh
# =============================================================================== #
# Background Daemon:                                                              #
# =============================================================================== #
pkill wbg;wbg ~/Pictures/pix/wallpapers/A_FOGGY_FOREST_WITH_TREES.png &
# =============================================================================== #
#  App Daemon                                                                     #
# =============================================================================== #
pkill mako; mako &
pkill udiskie;udiskie &
pkill pipewire;pipewire &
pkill pipewire-pulse;pipewire-pulse &
