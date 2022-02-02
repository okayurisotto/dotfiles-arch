#!/bin/sh

sysresources="/etc/X11/xinit/.Xresources"
sysmodmap="/etc/X11/xinit/.Xmodmap"
userresources="$HOME/.Xresources"
usermodmap="$HOME/.Xmodmap"
userprofile="$HOME/.xprofile"

[[ -f "$sysresources"  ]] && xrdb -merge "$sysresources"
[[ -f "$sysmodmap"     ]] && xmodmap "$sysmodmap"
[[ -f "$userresources" ]] && xrdb -merge "$userresources"
[[ -f "$usermodmap"    ]] && xmodmap "$usermodmap"
[[ -f "$userprofile"   ]] && . "$userprofile"

if [[ -d "/etc/X11/xinit/xinitrc.d" ]] ; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
    [[ -x "$f" ]] && . "$f"
  done
fi

# https://wiki.archlinux.jp/index.php/GNOME/Keyring
eval "$(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)"
export SSH_AUTH_SOCK

exec i3
# exec bspwm
