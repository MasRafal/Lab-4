#!/bin/bash

function print_help {
  echo "Dostępne opcje:"
  echo "--date, -d          Wyświetla dzisiejszą datę"
  echo "--logs, -l [N]      Tworzy N plików logx.txt z informacjami"
  echo "--error, -e [N]     Tworzy N plików errorx/errorx.txt z informacjami"
  echo "--help, -h          Wyświetla dostępne opcje"
  echo "--init              Klonuje repozytorium i ustawia ścieżkę w zmiennej PATH"
}

function create_logs {
  local count=${1:-100}
  for i in $(seq 1 $count); do
    local filename="log${i}.txt"
    echo "Nazwa pliku: $filename" > $filename
    echo "Nazwa skryptu: $0" >> $filename
    echo "Data utworzenia: $(date)" >> $filename
  done
}

function create_errors {
  local count=${1:-100}
  mkdir -p errors
  for i in $(seq 1 $count); do
    local filename="errors/error${i}.txt"
    echo "Nazwa pliku: error${i}.txt" > $filename
    echo "Nazwa skryptu: $0" >> $filename
    echo "Data utworzenia: $(date)" >> $filename
  done
}

function init_repo {
  local repo_url=$(git config --get remote.origin.url)
  if [ -z "$repo_url" ]; then
    echo "Brak zdalnego repozytorium. Upewnij się, że jesteś w repozytorium Git."
    exit 1
  fi
  git clone "$repo_url" cloned_repo
  export PATH=$PATH:$(pwd)/cloned_repo
  echo "Repozytorium sklonowane do katalogu 'cloned_repo' i dodane do PATH"
}

case $1 in
  --date|-d)
    date
    ;;
  --logs|-l)
    create_logs $2
    ;;
  --error|-e)
    create_errors $2
    ;;
  --help|-h)
    print_help
    ;;
  --init)
    init_repo
    ;;
  *)
    echo "Nieznana opcja. Użyj --help lub -h, aby zobaczyć dostępne opcje."
    ;;
esac




