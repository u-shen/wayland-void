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
	-active-fg-color "#141b1e" \
	-active-bg-color "#8ccf7e" \
	-inactive-fg-color "#c4b28a" \
	-inactive-bg-color "#141b1e" \
	-urgent-fg-color "#141b1e" \
	-urgent-bg-color "#e57474" \
	-title-fg-color "#141b1e" \
	-title-bg-color "#141b1e"
