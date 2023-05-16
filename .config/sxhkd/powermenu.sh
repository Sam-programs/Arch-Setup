#! /bin/sh

choice=$(printf "Cancel\nShutDown\nRestart\nSwitch Users\nSleep" | rofi -dmenu -i -p "PowerMenu:")

case "$choice" in 
   "Cancel")   exit 0;;
   "ShutDown") systemctl shutdown now;;
   "Restart")  systemctl reboot -i;;
   "Sleep")    systemctl suspend;;
   "Switch Users")  bspc quit;;
   *)exit 1 ;;
esac
