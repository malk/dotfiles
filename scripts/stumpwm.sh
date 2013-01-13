#!/bin/sh

sh ~/.profile
eval `dbus-launch --sh-syntax --exit-with-session` &
ssh-agent &
trayer --SetDockType false --transparent true --expand false&
gnome-settings-daemon &
xfce4-power-manager &
nm-applet --sm-disable &
system-config-printer-applet &
start-pulseaudio-x11 &
gnome-keyring-daemon --start --components=secrets &
gnome-keyring-daemon --start --components=pkcs11 &
gnome-keyring-daemon --start --components=ssh &
bluetooth-applet &

exec stumpwm
