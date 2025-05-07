#!/bin/sh
# =============================================================================== #
# Idle ScreenSaver:                                                               #
# =============================================================================== #
pkill swayidle; exec swayidle -w \
	timeout 300 "waylock -init-color 0x151515 -input-color 0x8C977D -fail-color 0xB66467" \
	timeout 600 "wlr-randr --output eDP-1 --off" resume "wlr-randr --output eDP-1 --on" \
	before-sleep "waylock -init-color 0x151515 -input-color 0x8C977D -fail-color 0xB66467" &
