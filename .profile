# Copyright (C) 2012 by Romeu MOURA
# default permission is of giving nothing to others or groups, this is
# added on a need basis
umask 077

# set PATH so it includes my private scripts dir
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export EDITOR=emacsclient
export VISUAL=emacsclient
export ORGANIZATION="Romeu MOURA"
export GPGKEY=95012A48


# clean and start my junkdrawer, it really resides on /tmp which is
# mounted as tmpfs (so on memory), hence things written there only
# last a session
#JUNK=$HOME/tmp
#rm -rf /tmp/$LOGNAME/junk $JUNK
#mkdir -p /tmp/$LOGNAME/junk
#ln -s /tmp/$LOGNAME/junk $JUNK

# Downloads go on the junkdrawer, chrome is configured for that

# make sure flash cache data goes into the junk drawer
#rm -rf $HOME/.adobe
#mkdir $JUNK/.adobe
#ln -s $JUNK/.adobe $HOME/.adobe

#rm -rf $HOME/.macromedia
#mkdir $JUNK/.macromedia
#ln -s $JUNK/.macromedia $HOME/.macromedia


# aptitude also cache stuff so lets put it on the junkdrawer too
#rm -rf $HOME/.aptitude
#mkdir $JUNK/.aptitude
#ln -s $JUNK/.aptitude $HOME/.aptitude

# The .cache seems like the perfect candidate, but has too much stuff
# I'd rather keep around betwen sessions, so lets avoid it for the
# moment, maybe I'll put the directories with media on junkdrawer?

