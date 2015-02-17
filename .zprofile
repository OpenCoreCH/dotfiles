# automatically start X server if on TTY1
if [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	startx
fi
