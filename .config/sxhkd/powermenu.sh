#! /bin/sh

choice=$(printf "Cancel\nShutDown\nRestart\nLog Out" | rofi -dmenu -i -p "PowerMenu:")

case "$choice" in 
   "Cancel")   exit 0;;
   "ShutDown") shutdown now;;
   "Restart")  reboot;;
   "Log Out")  bspc quit;;
   *)exit 1 ;;
esac
