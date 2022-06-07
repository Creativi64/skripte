#!/bin/bash 

if [ "$(/usr/bin/id -u)" != "0" ]; then
       echo "you must be root to run this script"
       exit 1
fi

#CSV PATTERN: NAME; NACHNAME; GB; (Primärgruppen) Gruppe1,Gruppe2; (Sekundärgruppen) Gruppe1,gruppe2
DELIMETER=";"
DELIMETERORDNER=","

if [[ $# -ne 1 || ! -f $1 ]];then
    z=false

    while [[ "$z" == "false" ]];do
        echo "Bitte geben Sie den Namen der"
        echo -e "csv-Benutzerdatei an: \c"
        read -r Datei
        if [[ -f "$Datei" ]];then
            z=true
        else
            z=false
        fi
    done
else
    Datei="$1"
fi

while read -r Zeile 
do
    echo "$Zeile"
    Name=$(echo "$Zeile" | tr '[:upper:]' '[:lower:]' | cut -d"$DELIMETER" -f1)
    Vorname=$(echo "$Zeile" |tr '[:upper:]' '[:lower:]' | cut -d"$DELIMETER" -f2)
    Geb_am=$(echo "$Zeile" | cut -d"$DELIMETER" -f3)
    Gruppen=$(echo "$Zeile" |tr '[:upper:]' '[:lower:]' | cut -d"$DELIMETER" -f4)
    PGruppe=$(echo "$Gruppen" | cut -d"$DELIMETERORDNER" -f1)
    SGruppen=$(echo "$Gruppen" | cut -d"$DELIMETERORDNER" -f2-)
    Ordner=$(echo "$Zeile" | tr '[:upper:]' '[:lower:]' | cut -d"$DELIMETER" -f5)
    loginuser=$(echo "${Name}${Vorname}" | sed "s/ //g") #Leerzeichen entfernen!
    echo "Name: $Name, Vorname: $Vorname, Geboren am: $Geb_am, PGruppe: $PGruppe, SGruppen: $SGruppen, Zugriffsrechte auf die Ordner: $Ordner "

    Passwort=$(echo "Geb_am" | sed "s/ //g" | sed "s/\.//g" | openssl passwd -1 -stdin)
    echo "$Passwort" # Hier bereits als Hash-Wert!

    sudo useradd -d /home/"$loginuser" -m -g "$PGruppe" -G "$SGruppen" -k /etc/skel -s /bin/bash -p "$Passwort" "$loginuser"

    OrdnerA=$(echo "$Ordner" | sed "s/ //g" | sed "s/,/ /g") # zuerst werden alle Leerzeichne entfernt und komma
    Ordner=( "$OrdnerA" ) # definiert ein Array
    z=0

    while [[ $z -lt ${#Ordner[@]} ]] 
    do 
        ## Anzahl der Felder: echo "${#Ordner[@]}"
        if [[ ! -d "/home/${Ordner[${z}]}" ]]; then
            mkdir "/home/${Ordner[${z}]}"
            echo "/home/${Ordner[${z}]} wird angelegt"
        fi 
        setfacl -Rm u:"${loginuser}":rwx /home/"${Ordner[${z}]}"
        setfacl -dm u:"${loginuser}":rwx /home/"${Ordner[${z}]}"
        ((z++))
    done
done < "$Datei"
