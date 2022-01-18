#!/bin/bash

# Die Datei, die als Argument $1 übergeben wurde,
# soll zeilenweise eingelesen werden
cat $1 | while read variable
do
echo $variable
done

# Die übergebene Datei Namensliste sieht z. B. wie folgt aus
# Meier,Peter,03.05.1999,Hofgarten,33,91555,Ansbach,09123-88842
# Huber,Rudi,03.06.2000,Hufgasse,3,91122,Schwabach,09122-82441
# Schmid,Hans,02.07.1998,Zu den Gründen,1,95355,Röttenbach,0911-842
# Kerner,Otto,31.10.1997,Am Bahnhof,1,91421,Hallstadt,09993-83122

# Von einer Textdatei „.txt“ bzw. CSV-Datei „.csv“ werden nur alle Zeilen eingelesen,
# wenn jede Zeile – auch die letzte Zeile - mit einem „<RETURN>“ („\n“)
# abgeschlossen ist.
# Ist dies nicht der Fall, geht meist die letzte Zeile, die häufig ohne „\n“ endet,
# verloren.
# Dies kann durch Anwendung des Befehls mapfile, der die einzelnen Zeilen Array-
# Feldern zuordnet, nicht unterlaufen. Man muss dann aber mit Array-Befehlen
# weiter arbeiten.