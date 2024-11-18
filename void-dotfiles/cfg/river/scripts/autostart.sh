#!/bin/sh
#==========================#
# Screen sharing:          #
#==========================#
exec dbus-update-activation-environment DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=river &
#==========================#
# Background Daemon:       #
#==========================#
killall wbg;wbg ~/pix/wallpapers/WITCHER.png &
#==========================#
#  App Daemon              #
#==========================#
# killall waybar;waybar &
killall dam;dwl_bar | dam &
killall swaync; swaync &
killall udiskie;udiskie &
killall nm-applet;nm-applet --no-agent &
killall blueman-applet;blueman-applet &
killall pipewire;pipewire &
killall pipewire-pulse;pipewire-pulse &
