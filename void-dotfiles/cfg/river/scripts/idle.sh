#!/bin/sh
exec swayidle -w \
	timeout 300 "waylock -init-color 0x181616 -input-color 0x689d6a -fail-color 0xcc241d" \
	timeout 600 "wlr-randr --output eDP-1 --off" resume "wlr-randr --output eDP-1 --on" &
