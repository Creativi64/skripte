#!/bin/bash

#datei="./ips.csv"
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

#
# SORT VIA ITERRATIVE QUICKSORT
#

# quicksorts positional arguments
# return is in array qsort_ret
# Note: iterative, NOT recursive! :)
qsorti() {
    (($# == 0)) && return 0
    local -i teiler=$1
    shift
    local stack=(0 $(($# - 1))) beg end i pivot smaller larger
    qsort_ret=("$@")
    while ((${#stack[@]})); do
        beg=${stack[0]}
        end=${stack[1]}
        stack=("${stack[@]:2}")
        smaller=() larger=()
        pivot=${qsort_ret[beg]}
        for ((i = beg + 1; i <= end; ++i)); do
            if [[ $(echo "${qsort_ret[i]}" | cut -d',' -f"$teiler") < $(echo "$pivot" | cut -d',' -f"$teiler") ]]; then
                smaller+=("${qsort_ret[i]}")
            else
                larger+=("${qsort_ret[i]}")
            fi
        done
        qsort_ret=("${qsort_ret[@]:0:beg}" "${smaller[@]}" "$pivot" "${larger[@]}" "${qsort_ret[@]:end+1}")
        if ((${#smaller[@]} >= 2)); then stack+=("$beg" "$((beg + ${#smaller[@]} - 1))"); fi
        if ((${#larger[@]} >= 2)); then stack+=("$((end - ${#larger[@]} + 1))" "$end"); fi
    done
}

IPqsorti() {
    (($# == 0)) && return 0
    local -i teiler=$1
    shift
    local stack=(0 $(($# - 1))) beg end i pivot smaller larger
    qsort_ret=("$@")
    while ((${#stack[@]})); do
        beg=${stack[0]}
        end=${stack[1]}
        stack=("${stack[@]:2}")
        smaller=() larger=()
        pivot=${qsort_ret[beg]}
        for ((i = beg + 1; i <= end; ++i)); do
            if [ "$(echo "${qsort_ret[i]}" | cut -d'.' -f"$teiler")" -lt "$(echo "$pivot" | cut -d'.' -f"$teiler")" ]; then
                smaller+=("${qsort_ret[i]}")
            else
                larger+=("${qsort_ret[i]}")
            fi
        done
        qsort_ret=("${qsort_ret[@]:0:beg}" "${smaller[@]}" "$pivot" "${larger[@]}" "${qsort_ret[@]:end+1}")
        if ((${#smaller[@]} >= 2)); then stack+=("$beg" "$((beg + ${#smaller[@]} - 1))"); fi
        if ((${#larger[@]} >= 2)); then stack+=("$((end - ${#larger[@]} + 1))" "$end"); fi
    done
}
 
echo "####################"

qsorti 1 "${TESTMAP[@]}"

declare qsort_ret
printf "%s\n" "${qsort_ret[@]}"
echo "==========="
qsorti 2 "${TESTMAP[@]}"
printf "%s\n" "${qsort_ret[@]}"

echo "--"
echo "==========="
echo "--"

# IP Sort

mapfile -t TESTMAP <ips.csv

for ((i = 4; i > 0; i--)); do
    echo "${i}"
    IPqsorti "${i}" "${TESTMAP[@]}"
    TESTMAP=("${qsort_ret[@]}")
done
 
declare -a Ausgabe
declare -i zaehler
zaehler=65

for item in "${TESTMAP[@]}"; do
    zeichen=$(printf "\x$(printf %x $zaehler)")
    Ausgabe+=("$zeichen $item")
    zaehler=$zaehler+1
done


printf "%s\n" "${qsort_ret[@]}"
echo "--"
printf "%s\n" "${Ausgabe[@]}" 
text="$(printf "%s\n" "${Ausgabe[@]}" )"
 zaehler=1
 #"$($zaehler "$item" "\")"
echo "========"
 echo "$text"

dialog --msgbox "$text" 15 50

#result=$(cat "/tmp/hhhh$$")

echo "####################"
echo "END"
echo "####################"
