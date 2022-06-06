#!/bin/bash
if [ ! -e "$1" ] || [ ! -r "$1" ]; then
    clear
    echo "###########################################################################"
    echo "# 1. Sie müssen dem Skript eine csv-Datei \"\$1\" als Parameter um-"
    echo "#    schlossen von Anführungs-Zeichen (\") mitgeben!"
    echo "# 2. Außerdem können Sie das Trennzeichen als zweiten Parameter z.B. \";\""
    echo "#    mitgeben!"
    echo "###########################################################################"
    exit
fi
csv_datei="$1"
Trennzeichen="${2:-,}"
echo " "
echo "Es folgt das transponierte Array:"
echo "-----------------------------------------------------------------------------------------"
while read line; do
    ###  echo "$line"
    IFS="$Trennzeichen" read -r -a felder <<<$line
    # echo "---${felder[@]}"
    for ((i = 0; i < "${#felder[@]}"; i++)); do
        a[$i]="${a[$i]} ${felder[$i]} |"
    done
done <$csv_datei

for ((i = 0; i < ${#a[@]}; i++)); do
    echo "${a[i]}"
done
