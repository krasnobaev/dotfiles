~/.bash_profile

trayer --expand true --edge bottom --align right --widthtype request --transparent true --tint black --SetDockType true& 

synapse&

nm-applet&

if [ -z "$(pgrep workrave)" ]; then
	workrave&
fi

if [ -z "$(pgrep python)" ]; then
	ipython3 notebook --no-browser --notebook-dir=/home/sypwex/src/python/notebooks 2> /dev/null&
fi

# ALSA/JACK control panel
if [ -z "$(pgrep jackd)" ]; then
	cadence&
	qjacktl&
fi

# printer manager
if [ -z "$(pgrep system-config-printer-applet)" ]; then
	system-config-printer-applet&
fi

if [ -z "$(pgrep dropbox)" ]; then
	dropbox start&
fi

wmname LG3D

guake&

