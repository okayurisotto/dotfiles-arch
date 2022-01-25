#!/bin/sh

userresources="$HOME/.Xresources"
usermodmap="$HOME/.Xmodmap"
sysresources="/etc/X11/xinit/.Xresources"
sysmodmap="/etc/X11/xinit/.Xmodmap"

[[ -f "$sysresources"  ]] && xrdb -merge "$sysresources"
[[ -f "$sysmodmap"     ]] && xmodmap "$sysmodmap"
[[ -f "$userresources" ]] && xrdb -merge "$userresources"
[[ -f "$usermodmap"    ]] && xmodmap "$usermodmap"

if [[ -d "/etc/X11/xinit/xinitrc.d" ]] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [[ -x "$f" ]] && . "$f"
    done
    unset f
fi

xprofile="$HOME/.xprofile"
[[ -f "$xprofile" ]] && . $xprofile

# https://wiki.archlinux.jp/index.php/GNOME/Keyring
eval "$(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)"
export SSH_AUTH_SOCK

exec i3
# exec bspwm
