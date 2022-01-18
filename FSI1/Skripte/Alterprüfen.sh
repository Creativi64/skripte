#!/bin/bash
DIALOG=${DIALOG=dialog}

USERDATE=$($DIALOG --stdout --title "CALENDAR" --calendar "Please choose a date..." 0 0 1 1 2000)
#USERDATE=25/03/2004
#echo "$USERDATE"
echo "------------------------------------------------------------------------"
IFS="/"
set $USERDATE
Tag="$1"
Monat=$(date +%b -d "$2")
Jahr="$3"

echo "GB: Tag: $Tag Monat: $Monat Jahr: $Jahr"
echo "------------------------------------------------------------------------"
((erwachsen= 18 + Jahr))
#echo erwachesn "$erwachsen"
volljaehrig=$(date +%d/%m/%Y -d "${Tag} ${Monat} ${erwachsen}")

echo "volljaehrig= $volljaehrig"
echo "------------------------------------------------------------------------"
heute2=$(date "+%d""/%m""/%Y")
echo "Heute = $heute2"
echo "------------------------------------------------------------------------"
aktdatum=$(date +%s)
Alter18=$(date +%s -d "${Tag} ${Monat} ${erwachsen}")
#echo "$aktdatum"
#echo "$Alter18"
if [[ "$Alter18" -lt "$aktdatum" ]]; then
     
     echo "##############################"
     echo "Du bist Volljährig"
     echo "##############################"
else
     echo "##############################"
     echo "Du bist nicht volljährig"
     echo "##############################"
fi
