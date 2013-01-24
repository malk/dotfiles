#!/bin/sh

# I need this PPPA for grive
sudo add-apt-repository ppa:nilarimogard/webupd8

# I need this PPA for the sun JDK 7
sudo add-apt-repository ppa:webupd8team/java

# we take in consideration the above PPA
sudo apt-get update

# I use aptitude, so the first thing I do is use apt-get to install aptitude
# and forget about apt-get afterwards
sudo apt-get install aptitude debtags tagcoll

# to avoid any possible problems/confusions between different CL
# alternatives I install this is its own command before stumpwm
sudo aptitude install sbcl cl-clx-sbcl cl-ppcre

# now I install all other Pacakges I use

sudo aptitude install git emacs24 chromium-browser gnupg2 monkeysphere feh \
gimp cheese xclip trayer xfce4-power-manager stumpwm oracle-java7-installer \
grive gtk-chtheme qt4-qtconfig rxvt-unicode-256color xbacklight aspell-fr \
aspell-br rolldice global id-utils scrot libncurses5-dev exuberant-ctags

# I use GNU global, unfortunately the debian/ubuntu package for global is
# aeons old and unusable so he drop down to an older style of install
(umask 022; mkdir /tmp/gnu-global; cd /tmp/gnu-global; wget http://tamacom.com/global/global-6.2.7.tar.gz; tar xzf global-6.2.7.tar.gz; cd global*; ./configure --with-exuberant-ctags=/usr/bin/ctags-exuberant; make; sudo make install)

