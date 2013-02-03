#!/bin/sh

# default permission is of giving nothing to others or groups, this is
# added on a need basis
umask 077

# set PATH so it includes my private scripts dir
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# my editor of choice is emacs, I use it on server-mode so I configure
# things to call emacsclient
export EDITOR=emacsclient
export VISUAL=emacsclient

# Emacs copyright-update uses the ORGANIZATION env variable as a default
# copyright owner, I put myself
export ORGANIZATION="Romeu MOURA"



# clean and start my junkdrawer, it really resides on /tmp which is
# mounted as tmpfs (so on memory), hence things written there only
# last a session
JUNK=$HOME/tmp
rm -rf /tmp/$LOGNAME/junk $JUNK
mkdir -p /tmp/$LOGNAME/junk
ln -s /tmp/$LOGNAME/junk $JUNK

# Downloads go on the junkdrawer, chrome is configured for that

# Most things I'll start will use dbus, so we start with that
eval `dbus-launch --sh-syntax --exit-with-session` &

# nm-applet only works correctly with a tray, other apps are improved by the
# presence of one, trayer is lightweight
trayer --SetDockType false --transparent true --expand false&

# just in case we use some gnome confs for our gnome programs here
gnome-settings-daemon &

# compatible with the gnome one but lighter, we sorely need power
# management, so this is mandatory
xfce4-power-manager &

# watches the network, a blessing for wifi
nm-applet --sm-disable &

# my work uses printers from time to time
system-config-printer-applet &

# lets put the audio responsibility on a recent standard (apparently every
# solution is a different compromise of necessary evil?)
start-pulseaudio-x11 &

# sometimes I use bluetooth to connect my phone and computer together
bluetooth-applet &

# since we are already on a gnome vibe, lets use gnome-keyring as our
# ssh-agent, as a bonus it will give to sensible applications access to ssh
# keys, password lists, etc
eval $(/usr/bin/gnome-keyring-daemon --daemonize --login --start --components=gpg,pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID

# adds some sudo hocus pocus
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &

# I use a main GPG RSA key for every key need I can, I try to sign it into a
# web of thrust, and publish my public keys on some keyservers (they
# propagate, so you can fetch my public key from your server of choice quite
# probably)

# this is my key id
export GPGKEY=95012A48

# this uses monkeysphere to charge my auth subkey into gnome-keryring as my
# ssh key for the current session, So i need not to create a separate rsa
# key just for ssh
monkeysphere s &


# my WM of choice for the moment is stumpwm, I actually think that all 3
# major tiling windows managers with programming languages used cor
# configuration(stumpwm, xmonad and awesome) are equally good choices,
# stumpwm is just the one a smidge closer to emacs itself as its uses lisp
# and can connect to swank
exec stumpwm


# Copyright 2013 Romeu MOURA
# This file is part of Dotfiles. Dotfiles is free software: you can
# redistribute it and/or modify it under the terms of the GNU General Public
# License as published by the Free Software Foundation, either version 3 of
# the License, or (at your option) any later version. Dotfiles is
# distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
# without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE. See the GNU General Public License for more details.
# You should have received a copy of the GNU General Public License along
# with Dotfiles. If not, see <http://www.gnu.org/licenses/>.

