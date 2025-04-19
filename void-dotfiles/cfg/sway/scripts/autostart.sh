#!/bin/sh
# =============================================================================== #
#  App Daemon                                                                     #
# =============================================================================== #
killall mako; mako &
killall udiskie;udiskie &
killall pipewire;pipewire &
killall pipewire-pulse;pipewire-pulse &
