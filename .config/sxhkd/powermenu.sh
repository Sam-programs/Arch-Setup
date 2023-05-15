#! /bin/sh

choice=$(printf "Cancel\nShutDown\nRestart\nLog Out" | rofi -dmenu -i -p "PowerMenu:")

case "$choice" in 
   "Cancel")   exit 0;;
   "ShutDown") systemctl shutdown now;;
   "Restart")  systemctl reboot -i;;
   "Log Out")  bspc quit;;
   *)exit 1 ;;
esac
