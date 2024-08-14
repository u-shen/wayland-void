# if running bash
if [ -n "$BASH_VERSION" ]; then
	# include .bashrc if it exists
	if [ -f "$HOME/.bashrc" ]; then
		. "$HOME/.bashrc"
	fi
fi
# If running from tty Start Compositor
[ "$(tty)" = "/dev/tty1" ] && exec dbus-run-session dwl_exec >/dev/null 2>&1
