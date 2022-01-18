#!/bin/bash
i=1
while read line
do
  echo "$i. Zeile: $line"
  ((i=$i+1))

# << Liest alles Bist zum Nachsten Falg ein
# < Sucht nach Einer Datei
# > schreibt in eine Datei
done <<TEXT
EIne Zeile
$(date)
Homeverzeichnis $HOME
Das Ene
TEXT

# Das bash-Skript enthält von Zeile 3 bis Zeile 5 eine WHILE-Schleife. Die While-
# Schleife wird über die HERE-Anweisung mit den in den Zeilen 6 bis zur Marke
# „TEXT“ folgenden Code gespeist. Dabei werden die im Text enthaltenen
# Substitutionen innerhalb der While-Schleife ausgeführt und die Ergebnisse
# dargestellt.
# Würde man in der Zeile an der Position „done“ nur einen Pfeil nach links „<“
# verwenden, so wäre es keine HERE-Anweisung mehr. Es würde dann nach einer
# Datei mit dem Namen „TEXT“ im Dateiverzeichnis gesucht werden. Ist eine solche
# Datei vorhanden, wird diese in die While-Schleife in Zeile 6 eingelesen. Die
# restlichen Zeilen würden als separate Befehle interpretiert bzw. ausgeführt werden.e