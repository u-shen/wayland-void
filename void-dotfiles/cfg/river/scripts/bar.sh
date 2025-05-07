#!/usr/bin/env sh
# =============================================================================== #
# Bar Sandbar:                                                                    #
# =============================================================================== #
FIFO="$XDG_RUNTIME_DIR/sandbar"
[ -e "$FIFO" ] && rm -f "$FIFO"
mkfifo "$FIFO"

# -tags 9 " " " " " " " " " " " " " " " " " " \
pkill sandbar; while cat "$FIFO"; do :; done | sandbar \
	-no-layout -hide-normal-mode \
	-active-fg-color "#151515" \
	-active-bg-color "#8C977D" \
	-inactive-fg-color "#c4b28a" \
	-inactive-bg-color "#151515" \
	-urgent-fg-color "#151515" \
	-urgent-bg-color "#B66467" \
	-title-fg-color "#151515" \
	-title-bg-color "#151515"
