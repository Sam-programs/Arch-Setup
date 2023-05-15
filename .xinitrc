#!/bin/sh

exec ~/.fehbg &
exec polybar&
exec flameshot&
exec copyq&

exec alacritty -e vim ~/.config/sxhkd/sxhkdrc &

exec bspwm

