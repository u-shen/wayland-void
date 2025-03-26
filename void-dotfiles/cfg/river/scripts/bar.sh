#!/usr/bin/env sh

FIFO="$XDG_RUNTIME_DIR/sandbar"
[ -e "$FIFO" ] && rm -f "$FIFO"
mkfifo "$FIFO"

pkill sandbar; while cat "$FIFO"; do :; done | sandbar \
  -tags 9 " " " " " " " " " " " " " " " " " " \
	-no-layout -hide-normal-mode \
	-active-fg-color "#181616" \
	-active-bg-color "#8a9a7b" \
	-inactive-fg-color "#c4b28a" \
	-inactive-bg-color "#181616" \
	-urgent-fg-color "#181616" \
	-urgent-bg-color "#c4746e" \
	-title-fg-color "#181616" \
	-title-bg-color "#8a9a7b"
