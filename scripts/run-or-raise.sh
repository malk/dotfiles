#!/bin/bash

win=$(xdotool search --classname $1)

shift

if [ "x$win" = x ]; then
    exec $@
else
    xdotool windowactivate $win
fi
