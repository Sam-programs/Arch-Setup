#!/bin/sh

exec ~/.fehbg &
exec polybar&
exec flameshot&
exec copyq&

exec alacritty -e nvim ~/.config/sxhkd/sxhkdrc &

exec bspwm

