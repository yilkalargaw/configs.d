# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

# ## autostart  x on login
# if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi

if [ -x "$(command -v direnv)" ] ; then
     eval "$(direnv hook bash)"
fi
