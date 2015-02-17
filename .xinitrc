#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi

# Set background
feh --bg-scale /home/roman/Bilder/wp1.jpg --bg-scale /home/roman/Bilder/wp2.jpg
# automatically lock after 10 minutes of inactivity
xautolock -time 10 -locker '/usr/bin/lock' &
# start i3
exec i3
