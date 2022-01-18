#!/bin/bash

#datei="$1"
#
#while read z
#do
#    echo $z
#done < $datei
# datei="$1"
datei=./namen.csv
declare -A array
# declare -A array2
while read -r z
do
    N=$(echo "$z" | cut -f1 -d",")
    V=$(echo "$z" | cut -f2 -d",")
    array["$N"]="$V" 
done < "$datei"

for k in "${!array[@]}"
do
    echo "$k" "${array["$k"]}"
done | sort -n #-k3
