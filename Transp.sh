#!/usr/bin/env bash

DELIMETER=","

mapfile -t LISTE <zahlen.csv
declare -a AUSGABE

printf "%s\n" "${LISTE[@]}"

echo "--"
echo ${#LISTE[@]}
ZEILEN=${#LISTE[@]} 
echo "${LISTE[0]}" | grep -o "$DELIMETER" | wc -l
SPALTEN=$(echo "${LISTE[0]}" | grep -o "$DELIMETER" | wc -l)
echo "--" 

declare -i spalte=0

for((i=1;i<(("$SPALTEN"+1));i++)); do
    for((j=0;j<(("$ZEILEN"));j++)); do
        AUSGABE[$spalte]+="$(echo "${LISTE[$j]}" | cut -d "$DELIMETER"  -f "$i"),"
    done
    spalte=$spalte+1
done
printf "%s\n" "${AUSGABE[@]}"