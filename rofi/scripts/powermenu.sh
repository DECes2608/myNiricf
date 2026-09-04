#!/bin/bash

# Seçenekleri belirle (Menüde görünecek sıra)
option=$(printf "Lock\nExit Niri\nReboot\nShutdown" | rofi -dmenu -p "Session")

# Seçime göre işlemi çalıştır
case "$option" in
"Lock")
  hyprlock # Kilit ekranı için hyprlock kullanıyorsan
  ;;
"Exit Niri")
  pkill niri
  ;;
"Reboot")
  systemctl reboot
  ;;
"Shutdown")
  systemctl poweroff
  ;;
esac
