#! /bin/sh

choice=$(printf "Cancel\nShutDown\nRestart\nSwitch Users\nSleep\nLog Out" | rofi -dmenu -i -p "PowerMenu:")

case "$choice" in 
   "Cancel")   exit 0;;
   "ShutDown") systemctl shutdown now;;
   "Restart")  systemctl reboot -i;;
   "Sleep")    systemctl suspend;;
   "Log Out")  xfce4-screensaver-command -l;;
   "Switch Users")  bspc quit;;
   *)exit 1 ;;
esac
