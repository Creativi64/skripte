#!/usr/bin/env bash
DELIMETER=","
mapfile -t LISTE <"$1"
declare -a AUSGABE
printf "%s\n" "${LISTE[@]}"
echo "--"
echo ${#LISTE[@]}
ZEILEN=${#LISTE[@]} 
echo "${LISTE[0]}" | grep -o "$DELIMETER" | wc -l
SPALTEN=$(echo "${LISTE[0]}" | grep -o "$DELIMETER" | wc -l)
echo "--" 

declare -i spalte=0
for((i=0;i<(("$ZEILEN"));i++)); 
do
    for((j="$SPALTEN";j>0;j--)); 
    do
        AUSGABE[$spalte]+="$(echo "${LISTE[$i]}" | cut -d "$DELIMETER"  -f "$j"),"
    done
    spalte=$spalte+1
done
printf "%s\n" "${AUSGABE[@]}"
printf "%s\n" "${AUSGABE[@]}" >ausgbe.csv 