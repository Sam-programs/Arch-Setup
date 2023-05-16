#! /bin/sh

choice=$(printf "Cancel\nShutDown\nRestart\nLog Out\nSleep" | rofi -dmenu -i -p "PowerMenu:")

case "$choice" in 
   "Cancel")   exit 0;;
   "ShutDown") systemctl shutdown now;;
   "Restart")  systemctl reboot -i;;
   "Sleep")    systemctl suspend;;
   "switch users")  bspc quit;;
   *)exit 1 ;;
esac
