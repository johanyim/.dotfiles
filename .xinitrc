#!/bin/sh
#
#~/.xinitrc
#

dwmblocks &
#feh --bg-scale "./ThinkPadT480Mocha.png"
feh --bg-scale --no-fehbg "./ThinkPadT480Mocha.png"


exec dwm 
