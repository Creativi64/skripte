#!/bin/bash
# datei="$1"
datei="./namen.csv"
declare -A namen
declare -a snamen
declare -i lauf=0
# Test="124"
# echo $Test
while read -r z
do
    N=$(echo "$z" | cut -f1 -d",")
    V=$(echo "$z" | cut -f2 -d",")
    namen["$N"]="$V"
    snamen["$lauf"]="$N"
    ((lauf++))
done < "$datei"

readarray -t sortiert < <(for a in "${snamen[@]}"; do echo "$a"; done | sort)

# for i in "${!namen[@]}"
# do
#     echo "$i" "${namen[$i]}"
# done

# echo  "Array namen unsortiert:" "${snamen[@]}"
# echo
# echo "Array Sortiert:" "${sortiert[@]}"
# echo
echo  "sortiertesd assoziatives array"

for k in "${!sortiert[@]}"
do
    nn=${sortiert[$k]}
    echo "$nn ${namen[$nn]}"
done