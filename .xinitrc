#!/bin/bash
# Executed by startx (run your window manager from here)

# if [ -d /etc/X11/xinit/xinitrc.d ]; then
#  for f in /etc/X11/xinit/xinitrc.d/*; do
#    [ -x "$f" ] && . "$f"
#  done
#  unset f
# fi

# exec gnome-session
# exec startkde
# exec startxfce4
# exec wmaker
# exec icewm
# exec blackbox
# exec fluxbox
# exec xterm

exec openbox-session

# Taken from:
# https://raw.github.com/kaihendry/Kai-s--HOME/master/.xinitrc
#
# for terminus font in Archlinux :(


#xset +fp /usr/share/fonts/local
#xset fp rehash

#xset -b # disable bell
#eval `/usr/bin/ssh-agent`

#if test -f /usr/lib/openssh/x11-ssh-askpass # Archlinux
#then
#	SSH_ASKPASS=/usr/lib/openssh/x11-ssh-askpass ssh-add < /dev/null
#fi

#if test -f /usr/lib/ssh/x11-ssh-askpass # Debian
#then
#	SSH_ASKPASS=/usr/lib/ssh/x11-ssh-askpass ssh-add < /dev/null
#fi

#xrdb -merge $HOME/.Xresources
#xmodmap ~/.Xmodmap
#setxkbmap -layout gb -option ctrl:nocaps

#hash chromium && chromium &

#while true
#do
#	VOL=$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')
#	LOCALTIME=$(date +%Z\=%Y-%m-%dT%H:%M)
#	OTHERTIME=$(TZ=Europe/London date +%Z\=%H:%M)
#	IP=$(for i in `ip r`; do echo $i; done | grep -A 1 src | tail -n1) # can get confused if you use vmware
#	TEMP="$(($(cat /sys/class/thermal/thermal_zone0/temp) / 1000))C"

#	if acpi -a | grep off-line > /dev/null
#	then
#		BAT="Bat. $(acpi -b | awk '{ print $4 " " $5 }' | tr -d ',')"
#		xsetroot -name "$IP $BAT $VOL $TEMP $LOCALTIME $OTHERTIME"
#	else
#		xsetroot -name "$IP $VOL $TEMP $LOCALTIME $OTHERTIME"
#	fi
#	sleep 20s
#done &

#exec dwm
