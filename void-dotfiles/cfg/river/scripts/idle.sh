#!/bin/sh
# =============================================================================== #
# Idle ScreenSaver:                                                               #
# =============================================================================== #
pkill swayidle; exec swayidle -w \
	timeout 300 "waylock -init-color 0x141b1e -input-color 0x8ccf7e -fail-color 0xe57474" \
	timeout 600 "wlr-randr --output eDP-1 --off" resume "wlr-randr --output eDP-1 --on" \
	before-sleep "waylock -init-color 0x141b1e -input-color 0x8ccf7e -fail-color 0xe57474" &
