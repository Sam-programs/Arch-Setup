#!/bin/sh

exec ~/.fehbg &

exec polybar&

exec flameshot&
exec copyq&
exec picom &

exec xfce4-screensaver&

exec xset r rate 300 50 &

exec alacritty -e vim ~/.config/sxhkd/sxhkdrc &

exec bspwm
