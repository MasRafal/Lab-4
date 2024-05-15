#!/bin/bash

# Sprawdź argumenty
case $1 in
  --date)
    # Wyświetl dzisiejszą datę
    date
    ;;
  --logs)
    # Utwórz logi
    count=100
    if [ -n "$2" ]; then
      count=$2
    fi
    for i in $(seq 1 $count); do
      filename="log${i}.txt"
      echo "Nazwa pliku: $filename" > $filename
      echo "Nazwa skryptu: $0" >> $filename
      echo "Data utworzenia: $(date)" >> $filename
    done
    ;;
  --help)
    # Wyświetl dostępne opcje
    echo "Dostępne opcje:"
    echo "--date        Wyświetla dzisiejszą datę"
    echo "--logs [N]    Tworzy N plików logx.txt z informacjami"
    echo "--help        Wyświetla dostępne opcje"
    ;;
  *)
    echo "Nieznana opcja. Użyj --help, aby zobaczyć dostępne opcje."
    ;;
esac





