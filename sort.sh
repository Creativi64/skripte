#!/bin/bash

datei="./namen.csv"

printf "Line 1\n Line2\n Line3\n" | (
    mapfile
    echo "${MAPFILE[@]}"
)
echo "-1----------"

printf "Line 1\n Line2\n Line3\n" | (
    mapfile -t
    echo "${MAPFILE[@]}"
)

echo "-2-----------"
mapfile -t < <(printf "Line 1\nLine 2\nLine 3")
printf "%s" "${MAPFILE[@]}"
echo ""

echo "-3-----------"
printf "%s\n" "${MAPFILE[0]}"
printf "%s\n" "${MAPFILE[2]}"

echo "-4-----------"

mapfile -t TESTMAP <namen.csv
echo "${TESTMAP[@]}"

echo "---"
echo "${TESTMAP[1]}"
echo "${TESTMAP[3]}"
echo "${TESTMAP[1]:0:4}" # Statischen Cutten

INPUT="${TESTMAP[1]}"
SUBSTRING=$(echo $INPUT | cut -d',' -f 2) # Dynamische cutten -d"TRENNZEICHEN" -f PART_AB_1
echo $SUBSTRING

echo "#########################"

# https://www.geeksforgeeks.org/mapfile-command-in-linux-with-examples/
# https://stackoverflow.com/questions/20243467/write-bash-array-to-file-with-newlines

declare -A namen
declare -a snamen
declare -i lauf=0
# Test="124"
# echo $Test
while read -r z; do
    N=$(echo "$z" | cut -f1 -d",")
    V=$(echo "$z" | cut -f2 -d",")
    namen["$N"]="$V"
    snamen["$lauf"]="$N"
    ((lauf++))
done <"$datei"

readarray -t sortiert < <(for a in "${snamen[@]}"; do echo "$a"; done | sort)

echo "sortiertesd assoziatives array"
echo "---------------------"
echo "${sortiert[@]}"
echo "${!sortiert[@]}"
echo "---------------------"

for k in "${!sortiert[@]}"; do
    nn=${sortiert[$k]} # Hier wird der Wert des schlüssel abgefragt mit ! NUMERISCH
    echo ">$k<"
    echo "$nn -> ${namen[$nn]}" # Schlüssel und wert printen Vorname-Nachname

    printf "[%s]-" "${sortiert[$k]}" # Wert Pritnen Von Numerischen Schlüssel aus Sorted
    printf "[%s]\n" "${namen[$nn]}"  # Aus Namen Den Namen Mit dem Schlüssel aus sorted
done

echo "------------"
printf "[%s]\n" "${sortiert[@]}"

qsort() {
    local pivot i smaller=() larger=()
    qsort_ret=()
    (($# == 0)) && return 0
    pivot=$1
    shift
    for i; do
        # This sorts strings lexicographically.
        c_i=$( echo "$i" | cut -d',' -f 2) # -f x ist nach was er sotiert muss unten gleich sein
        c_pivot=$( echo "$pivot" | cut -d',' -f 2)
        
        echo "$c_i"
        echo "$c_pivot"
        echo '====='

        if [[ $c_i < $c_pivot ]]; then
            smaller+=("$i")
        else
            larger+=("$i")
        fi
    done
    qsort "${smaller[@]}"
    smaller=("${qsort_ret[@]}")
    qsort "${larger[@]}"
    larger=("${qsort_ret[@]}")
    qsort_ret=("${smaller[@]}" "$pivot" "${larger[@]}")
}

qsort "${TESTMAP[@]}"
declare -p qsort_ret

printf "[%s]\n" "${qsort_ret[@]}"
