#!/bin/bash

# Seçenekleri belirle (Menüde görünecek sıra)
option=$(printf "Rofi\nNiri\nWaybar\nconfig" | rofi -dmenu -p "Session")

# Seçime göre işlemi çalıştır
case "$option" in
"Rofi")
  alacritty --title nvim -e nvim ~/.config/rofi
  ;;
"Niri")
  alacritty --title nvim -e nvim ~/.config/niri
  ;;
"Waybar")
  alacritty --title nvim -e nvim ~/.config/waybar
  ;;
"config")
  alacritty --title nvim -e nvim ~/.config
  ;;
esac
