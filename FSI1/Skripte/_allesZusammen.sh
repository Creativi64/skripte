#!/bin/bash

# In nachfolgendem Skript (Text 7) werden unterschiedliche Techniken und Befehle in
# Verbindung mit dem IFS angewandt. Beachten Sie den Unterschied zwischen einem
# assoziativ adressierten und indizierten Array. Der Befehl mapfile generiert
# gebunden an den Zeilen-Nr. der Text-Datei ein Array. Ein Index-Bezug im Skript
# sollte immer von Anführungszeichen umrahmt sein (siehe z.B. “${!adresseni[@]}“),
# ebenso sollte die Ausgabe des Arrays ebenfalls von Anführungszeichen umgeben
# sein.
# Beschreiben Sie die Funktion des nachfolgenden Skripts!

Adressena=() # assoziatives Array oder gehashtes Array
declare -a adresseni # indiziertes Array oder Array mit nummerischen Index
if [ $# -lt 1 ] || [ ! -f $1 ]
then
Skript=`echo "$0" | sed "s/\///g"`
echo "###### Achtung #########“
echo " Das Skript: $Skript muss "
echo " mit einer Adressliste.csv aufgerufen werden!"
ech######################"
exit 1
fi #cat "$1" | ( mapfile; echo "${MAPFILE[@]}")
mapfile -t < $1 # printf "%s\n" "${MAPFILE[@]}"
mapfile -t < $1
echo "#########--- print mapfile ---###############"
printf "%s" "${MAPFILE[@]}"
# Adressen=`shuf -e "${MAPFILE[@]}"`
Adressena=( "${MAPFILE[@]}" )
adresseni=( "${MAPFILE[@]}" )
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
for INDEX in "${!adresseni[@]}"
do
echo "Index=\"${INDEX}\" Wert=\"${adresseni[$INDEX]}\""
done
echo "#+#+#+#"
adresseni=( "${adresseni[@]}" )
for INDEX in "${!adresseni[@]}"
do
echo "Index=\"${INDEX}\" Wert=\"${adresseni[$INDEX]}\""
done
echo "-jetzt würfeln wir die Zeilen neu aus-"
shuf -e "${adresseni[@]}"
echo "----------Der Index bleibt aber bestehen!-----------"
z=0
while [ $z -lt ${#adresseni[@]} ]
do
echo "$z -> ${adresseni[$z]}"
((z++))
done
echo "----Formatierte Ausgabe der Adressliste ----------"
for INDEX in "${!adresseni[@]}"
do
#echo "Index=\"${INDEX}\" Wert=\"${adresseni[$INDEX]}\""
IFSBACK="$IFS"
Zeileninhalt="${adresseni[$INDEX]}"
IFS=","
set $Zeileninhalt
IFS="$IFSBACK"
echo -e "\n--- Id: ${INDEX} -----------------------\nName: $1"
echo -e "Vorname: $2 \ngeb. am: $3\nStraße: $4 $5\nPLZ: $6"
echo -e "Ort: $7\nTelefon: $8"
done

# Verwendet man die weiter oben in Aufgabe 1 deklarierte CSV-Adress-
# Datei als Übergabeparameter, so wird eine Konsolen-Ausgabe wie
# nebenstehend dargestellt generiert.
# Dies wird mittels des nummerisch indizierten Arrays erreicht, das die
# Adressdaten Zeilenweise adressiert.
# Der IFS wird auf das Komma “,“ gesetzt, so dass die einzelnen
# Adressteile jeder Zeile jeweils mittels „set“-Befehl in die
# Positionsparameter $1 bis $8 übernommen werden.
# Diese werden dann formatiert mittels einer FOR-Schleife bezogen auf
# den Array-Index wie nebenstehend dargestellt ausgegeben.

# --- Id: 0 -----------------------
# Name: Meier
# Vorname: Peter
# geb. am: 03.05.1999
# Straße: Hofgarten 33
# PLZ: 91555
# Ort: Ansbach
# Telefon: 09123-88842
# --- Id: 1 -----------------------
# Name: Huber
# Vorname: Rudi
# geb. am: 03.06.2000
# Straße: Hufgasse 3
# PLZ: 91122
# Ort: Schwabach
# Telefon: 09122-82441
# --- Id: 2 -----------------------
# Name: Schmid
# Vorname: Hans
# geb. am: 02.07.1998
# Straße: Zu den Gründen 1
# PLZ: 95355
# Ort: Röttenbach
# Telefon: 0911-842