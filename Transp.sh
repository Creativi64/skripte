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

echo "###########"
echo "START"
echo "###########"

declare -i spalte=0

for((i=1;i<(("$SPALTEN"+1));i++)); do
    for((j=0;j<(("$ZEILEN"));j++)); do
        #echo "###########"
        #echo "${i}, ${j}"
        #echo $spalte
        #echo "###########"
        #echo "${LISTE[$i]}"
        #echo "${LISTE[$i]}" | cut -d '.' -f "$j" 
        #echo "-------"
        #echo "${AUSGABE[$spalte]}"
        AUSGABE[$spalte]+="$(echo "${LISTE[$j]}" | cut -d "$DELIMETER"  -f "$i"),"
       
    done
    spalte=$spalte+1
done

echo "+++++++++++++++++++++++"

printf "%s\n" "${AUSGABE[@]}"