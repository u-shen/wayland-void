#!/usr/bin/env sh
#==========================#
# Bar Sandbar:             #
#==========================#
FIFO="$XDG_RUNTIME_DIR/sandbar"
[ -e "$FIFO" ] && rm -f "$FIFO"
mkfifo "$FIFO"

pkill sandbar; while cat "$FIFO"; do :; done | sandbar \
  -tags 9 " " " " " " " " " " " " " " " " " " \
	-no-layout -hide-normal-mode \
	-active-fg-color "#141617" \
	-active-bg-color "#8a9a7b" \
	-inactive-fg-color "#c4b28a" \
	-inactive-bg-color "#141617" \
	-urgent-fg-color "#141617" \
	-urgent-bg-color "#c4746e" \
	-title-fg-color "#141617" \
	-title-bg-color "#8a9a7b"
