#!/bin/sh
sysresources=/etc/X11/xinit/.Xresources
userresources=$HOME/.Xresources
userkeymaps=$HOME/.xbindkeysrc

# Merge in .Xresources and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$userkeymaps" ]; then
    xbindkeys
fi

# Start the programs in /etc/X11/xinit/xinitrc.d
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# Force KDE environment when running i3
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_PLUGIN_PATH=$HOME/.kde4/lib/kde4/plugins/:/usr/lib/kde4/plugins/
XDG_CURRENT_DESKTOP=KDE
export DESKTOP_SESSION=kde

