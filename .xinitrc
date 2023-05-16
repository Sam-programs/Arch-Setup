#!/bin/sh

exec ~/.fehbg &
exec polybar&
exec flameshot&
exec copyq&
exec xfce4-screensaver&

exec alacritty -e vim ~/.config/sxhkd/sxhkdrc &

exec bspwm

