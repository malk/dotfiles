#!/bin/sh

sh ~/.profile
eval `dbus-launch --sh-syntax --exit-with-session` &
trayer --SetDockType false --transparent true --expand false&
gnome-settings-daemon &
xfce4-power-manager &
nm-applet --sm-disable &
system-config-printer-applet &
start-pulseaudio-x11 &
eval $(/usr/bin/gnome-keyring-daemon --daemonize --login --start --components=gpg,pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
bluetooth-applet &
exec stumpwm
