#!/bin/sh
#==========================#
# Screen Sharings:         #
#==========================#
exec dbus-update-activation-environment DISPLAY I3SOCK SWAYSOCK WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=river &
#==========================#
# Background Daemon:       #
#==========================#
wbg ~/pix/wallpapers/GNU.png &
#==========================#
#  App Daemon              #
#==========================#
killall udiskie;udiskie --smart-tray --file-manager=nemo --terminal=foot &
killall waybar;waybar &
killall swaync;swaync &
killall nm-applet; nm-applet &
killall blueman-applet; blueman-applet &
killall pipewire;pipewire &
killall pipewire-pulse;pipewire-pulse &
