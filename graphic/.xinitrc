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

# to fix issues with podman
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u)/bus

# Fix Gnome Apps Slow  Start due to failing services
# Add this when you include flatpak in your system
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY

if [ -x "$(command -v xdg-user-dirs-update)" ] ; then
     xdg-user-dirs-update
fi

export GTK_USE_PORTAL=1

# export XDG_MENU_PREFIX="lxde-"
# export XDG_CURRENT_DESKTOP="LXDE" &&

# export NO_AT_BRIDGE=1

if [ -x "$(command -v xinput)" ] ; then
     xinput set-prop "ELAN0521:01 04F3:31B1 Touchpad" "libinput Tapping Enabled" 1
fi

if [ -x "$(command -v kvantummanager)" ] ; then
     export QT_STYLE_OVERRIDE=kvantum
   # export QT_QPA_PLATFORMTHEME="kvantum"
fi

if [ -f ~/.Xresources ] && [ -x "$(command -v xrdb)" ] ; then
     xrdb -load ~/.Xresources 
fi

if [ -x "$(command -v setxkbmap)" ] ; then
     setxkbmap -option caps:swapescape
fi

if [ -f ~/.Xmodmap ] && [ -x "$(command -v xmodmap)" ] ; then
     xmodmap ~/.Xmodmap
fi

# exec enlightenment_start
# exec i3
# exec mate-session
# exec xmonad
# exec startlxqt
# exec startlxde
exec awesome
# exec bspwm
# exec gnome-session
# exec gnome-session --session=gnome-classic
# exec startplasma-x11
# exec startplasma-wayland
# exec startxfce4
# exec startfluxbox
# exec openbox-session
# exec cinnamon-session
# exec pekwm
# exec catwm
# exec dwm
# exec startede
# exec icewm-session
# exec jwm
# exec monsterwm
# exec notion
# exec startdde       # deepin-session
