# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec

# User specific environment and startup programs
