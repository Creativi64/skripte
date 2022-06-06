#Aufgabe

#2.1  Verfassen Sie für alle Benutzer mit Ausnahme des Chefs Kurt ein Skript: „/sbin/arbeitszeit“.
#Das Skript kennt folgende Übergabeparameter: start, stop oder ende, status und pause. Jeder Benutzer darf nur die eigenen Werte in der csv-Datenerfassungsdatei daten.csv erfassen.
#In der Datei: daten.csv  sind folgende Werte je Benutzerlogin und Datum hinterlegt: <Datum>;<Benutzerlogin>;<letzter Startzeitpunkt>;<Status>;<Zeit in Sekunden>;
#Erstellen sie ein Teilskript, das bei der Übergabe des Parameters start zunächst nach dem Benutzerlogin zum heutigen Datum in Daten.csv sucht und falls dieser nicht gefunden wird neu anlegt und dabei den Startzeitpunkt (Linux-Zeitstempel) und den Status auf running; und die Zeit auf 0  stellt.
#Wurde bereits eine auf Datum und Loginname zutreffende Zeile in der Datei Daten.csv gefunden und steht diese auf den Status: stopped, so wird der Status dieser Zeile in Daten.csv auf „running“ gesetzt und die Startzeit auf den gegenwärtigen Linux-Zeitstempel gesetzt.





#Öffne das Skript: /home/Benutzername/.login.sh
#und füge die Zeile: „/sbin/arbeitszeit start“  ein!
#Das Skript kann aber auch manuell gestartet oder gestoppt werden.
#Das Skript könnte wie folgt aussehen:




##!!!!!Obere Kommentare löschen vor der Abgabe oder nur den Code unten copieren!!!!!




#/bin/bash
if  [[   “$1“  ==  “start“  ]]
then
    Datum=`date +%Y/%m/%d`
    Zeitstempel=`date +%s`
    if egrep "$USER" ./daten.csv
    then
        echo "$USER  ist bereits vorhanden"
    else
        echo "${Datum};${USER};${Zeitstempel},running,0"  >> ./daten.csv
    fi
fi
if  [[   “$1“  ==  “stop“  ]]
then
    #…......
fi
if  [[   “$1“  ==  “status“  ]]
then
    #….......
fi
if  [[   “$1“  ==  “pause“  ]]
then
    #…........
fi
if  [[   “$1“  ==  “ende“  ]]
then
    #…........
fi
