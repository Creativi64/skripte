#!/bin/bash

antwort=0

declare -a Schueler
declare -a SchuelerN
declare -a SchuelerGb

while [ $antwort = 0 ]; do
    echo 'eingabe'

    dialog --form "Bitte geben Sie die Werte ein!" 14 80 8 \
        "Vorname:" 1 1 "Moritz" 1 12 80 100 \
        "Nachnahme:" 3 1 "eckert" 3 12 80 28 \
        "GB:" 5 1 "10.20.2010" 5 12 80 100 2> \
        /tmp/hhh$$

    echo "-----s"

    Schueler=("${Schueler[@]}" "$(head -n 1 /tmp/hhh$$),$(head -n 2 /tmp/hhh$$ | tail -n 1),$(head -n 3 /tmp/hhh$$ | tail -n 1)")
    SchuelerN=("${SchuelerN[@]}" "$(head -n 2 /tmp/hhh$$ | tail -n 1),$(head -n 1 /tmp/hhh$$),$(head -n 3 /tmp/hhh$$ | tail -n 1)")
    SchuelerGb=("${SchuelerGb[@]}" "$(head -n 3 /tmp/hhh$$ | tail -n 1),$(head -n 1 /tmp/hhh$$),$(head -n 2 /tmp/hhh$$ | tail -n 1)")

    echo "---"

    dialog --yesno "weiter" 0 0

    antwort=$?
    #antwort=1

done

printf "[%s]\n" "${Schueler[@]}"
echo "---"

dialog --radiolist "tag item to choose" 15 50 8 \
    1 "Nach Vorname Sorieren" on \
    2 "Nach Nachname Sortieren" off \
    3 "Nach GB sortieren" off \
    4 "CSV exportieren" off 2>/tmp/hhhh$$
result=$(cat "/tmp/hhhh$$")

echo $result
echo "-|–|–|–|–"
clear
case "$result" in
1)
    echo 1
    IFS=$'\n' sorted=($(sort <<<"${Schueler[*]}"))
    unset IFS
    printf "[%s]\n" "${sorted[@]}"
    ;;
2)
    echo 2
    IFS=$'\n' sorted=($(sort <<<"${SchuelerN[*]}"))
    unset IFS
    printf "[%s]\n" "${sorted[@]}"
    ;;
3)
    echo 2
    IFS=$'\n' sorted=($(sort <<<"${SchuelerGb[*]}"))
    unset IFS
    printf "[%s]\n" "${sorted[@]}"
    ;;
4)
    echo CSV
    printf "%s\n" "${Schueler[@]}" >>./test.csv
    ;;

*)
    echo ERROR
    ;;
esac

rm /tmp/hhh$$
rm /tmp/hhhh$$
echo "Ende"
