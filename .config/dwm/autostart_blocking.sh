~/.bash_profile

trayer --expand true --edge bottom --align right --widthtype request --transparent true --tint black --SetDockType true& 

if [ -z "$(pgrep workrave)" ]; then
	workrave&
fi

if [ -z "$(pgrep python)" ]; then
	ipython3 notebook --no-browser --notebook-dir=/home/sypwex/src/python/notebooks 2> /dev/null&
fi

# ALSA/JACK control panel
if [ -z "$(pgrep jackd)" ]; then
	cadence&
fi

synapse&

# printer manager
if [ -z "$(pgrep system-config-printer-applet)" ]; then
	system-config-printer-applet&
fi

wmname LG3D

