#!/bin/bash

#2.1  Verfassen Sie für alle Benutzer mit Ausnahme des Chefs Kurt ein Skript: „/sbin/arbeitszeit".
#Das Skript kennt folgende Übergabeparameter: start, stop oder ende, status und pause. Jeder Benutzer darf nur die eigenen Werte in der csv-Datenerfassungsdatei daten.csv erfassen.
#In der Datei: daten.csv  sind folgende Werte je Benutzerlogin und Datum hinterlegt: <Datum>;<Benutzerlogin>;<letzter Startzeitpunkt>;<Status>;<Zeit in Sekunden>;
#Erstellen sie ein Teilskript, das bei der Übergabe des Parameters start zunächst nach dem Benutzerlogin zum heutigen Datum in Daten.csv sucht und falls dieser nicht gefunden wird neu anlegt und dabei den Startzeitpunkt (Linux-Zeitstempel) und den Status auf running; und die Zeit auf 0  stellt.
#Wurde bereits eine auf Datum und Loginname zutreffende Zeile in der Datei Daten.csv gefunden und steht diese auf den Status: stopped, so wird der Status dieser Zeile in Daten.csv auf „running" gesetzt und die Startzeit auf den gegenwärtigen Linux-Zeitstempel gesetzt.

#Öffne das Skript: /home/Benutzername/.login.sh
#und füge die Zeile: „/sbin/arbeitszeit start"  ein!
#Das Skript kann aber auch manuell gestartet oder gestoppt werden.
#Das Skript könnte wie folgt aussehen:

##!!!!!Obere Kommentare löschen vor der Abgabe oder nur den Code unten copieren!!!!!

if [[ "$1" == "start" ]]; then

    Datum=$(date +%Y/%m/%d)
    Zeitstempel=$(date +%s)
    if grep -E "$USER" ./daten.csv; then
        echo "$USER  ist bereits vorhanden"

        Status=$(grep -E "$USER" ./daten.csv | cut -d ";" -f4)
        echo "$Status"

        if [[ "$Status" == "stopped" ]]; then
           
            sed -i "/$USER;/c\ ${Datum};${USER};${Zeitstempel};running;0" ./daten.csv
            sed -i "s/ //" ./daten.csv # diese fooking leerzeichen entfernen
            echo "Restarted"
        fi 
    else

        echo "${Datum};${USER};${Zeitstempel};running;0" >>./daten.csv
    fi
fi

if [[ "$1" == "stop" ]]; then

    Datum2=$(date +%Y/%m/%d)
    echo "$Datum2"

    if grep -E "$Datum2" ./daten.csv | grep -E "$USER" >/tmp/hallo$$.txt; then

        # alte_Arbeitszeit=$(cat /tmp/hallo$$.txt | cut -f5 -d';' )
        jetzt=$(date +%s)

        alter_Zeitstempel=$(cat /tmp/hallo$$.txt | cut -f3 -d';')
        neue_Arbeitszeit=$(echo "$jetzt - $alter_Zeitstempel" | bc)

        cat ./daten.csv | grep -E -v "${Datum2};${USER};" >/tmp/hallo1234.txt
        mv /tmp/hallo1234.txt ./daten.csv

        echo "${Datum2};${USER};${jetzt};stopped;${neue_Arbeitszeit}" >>./daten.csv
    fi
fi
if [[ "$1" == "status" ]]; then
    :
    #….......
fi
if [[ "$1" == "pause" ]]; then
    :
    #…........
fi
if [[ "$1" == "ende" ]]; then
    :
    #…........
fi
