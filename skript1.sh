#!/bin/bash
Adressena=()
# assoziatives Array oder gehashtes Array
declare -a adresseni # indiziertes Array oder Array mit nummerischen Index
if [ $# -lt 1 ] || [ ! -f $1 ]; then
    Skript=$(echo "$0" | sed "s/.*\///g")
    echo "###### Achtung #########“
echo " Das Skript: $Skript muss "
echo " mit einer Adressliste.csv aufgerufen werden!"
ech######################"
    exit 1
fi
#cat "$1" | ( mapfile; echo "${MAPFILE[@]}")
mapfile -t <$1
# printf "%s\n" "${MAPFILE[@]}"
mapfile -t <$1
echo "#########--- print mapfile ---###############"
printf "%s" "${MAPFILE[@]}"
# Adressen=`shuf -e "${MAPFILE[@]}"`
Adressena=("${MAPFILE[@]}")
adresseni=("${MAPFILE[@]}")
# wichtig sind die Anführungszeichen!
# --> Siehe hierzu https://sysware.computer/linux/scripte_variablen_arrays.html
echo -e "\n--------------Adressen[@]-----------------------------"
#printf "%s\n" "${Adressen[@]}"
echo "${Adressena[@]}"
echo "#############-----Adressen[2]-------------##########"
echo "${adresseni[2]}"
echo "#######################################"
declare -p
echo "-#.-#-##--#-#-#-##-##--#-#-#-#"
echo "Das Array adressini[]:"
for INDEX in "${!adresseni[@]}"; do
    echo "Index=\"${INDEX}\" Wert=\"${adresseni[$INDEX]}\""
done
echo "#+#+#+#"
adresseni=("${adresseni[@]}")
for INDEX in "${!adresseni[@]}"; do
    echo "Index=\"${INDEX}\" Wert=\"${adresseni[$INDEX]}\""
done
echo "-jetzt würfeln wir die Zeilen neu aus-"
shuf -e "${adresseni[@]}"
echo "----------Der Index bleibt aber bestehen!-----------"
z=0
while [ $z -lt ${#adresseni[@]} ]; do
    echo "$z -> ${adresseni[$z]}"
    ((z++))
done
echo "----Formatierte Ausgabe der Adressliste ----------"
for INDEX in "${!adresseni[@]}"; do
    #echo "Index=\"${INDEX}\" Wert=\"${adresseni[$INDEX]}\""
    IFSBACK="$IFS"
    Zeileninhalt="${adresseni[$INDEX]}"
    IFS=","
    set $Zeileninhalt
    IFS="$IFSBACK"
    echo -e "\n--- Id: ${INDEX} -----------------------\nName: $1"
    echo -e "Vorname: $2 \ngeb. am: $3\nStraße: $4 $5\nPLZ:
$6"
    echo -e "Ort:
$7\nTelefon: $8"
done
