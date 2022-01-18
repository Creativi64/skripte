#! /bin/bash
trap "Tastenkombination ist unzulaessig!" INT QUIT TERM
## eben so wäre TSTP und KILL moeglich
while true; do
    var1=$(pwd)
    echo -e "$USER@$var1\>\c"
    read -r X
    case $X in
    "ls")
        echo "Befehl ist nicht erlaubt, nutze ls -l"
        ;;
    *)
        eval "$X"
        ;;
    esac
done
