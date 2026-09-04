#!/usr/bin/env bash
# Kitap seçip zathura ile tam ekran açan script
BOOK_DIR=${BOOK_DIR:-$HOME/kitaplar}

list_books() {
  cd "$BOOK_DIR" || exit
  for file in *.{pdf,epub,cbz,cbr,djvu,mobi}; do
    [[ -e "$file" ]] || continue
    echo "${file%.*}"
  done
}

CHOICE=$(list_books | rofi -dmenu -i -p "Kitap" \
  -theme-str "
    window { width: 50%; height: 60%; }
    listview { lines: 10; spacing: 5px; padding: 5px; }
    element { padding: 5px; border-radius: 15px; }
")

if [ -n "$CHOICE" ]; then
  BOOK=$(find "$BOOK_DIR" -maxdepth 1 -type f -iname "$CHOICE.*" | head -n1)
  [[ -n "$BOOK" ]] && zathura "$BOOK" &
fi
