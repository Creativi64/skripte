#!/bin/bash

# die voreingestellten Zeichen für IFS werden zunächst gesichert!
# damit er nach dem skript noch richtig von anderen verwendet werden kann
BACKIFS="$IFS"
# Minuszeichen als Trenner
IFS=:
if [ $# -lt 1 ]
then
echo "Das Skript: $0 benötigt einen User-login-Namen."
exit 1
fi
# Ausgabe anhand von Trennzeichen in IFS auftrennen
set `grep ^"$1" /etc/passwd`
echo `grep ^"$1" /etc/passwd`
echo "User : $1"
echo "User-Nummer : $3"
echo "Gruppen-Nummer : $4"
echo "Home-Verzeichnis : $6"
echo "Start-Shell : $7"

# 
IFS=$BACKIFS

# Der IFS „input field separator“ wird auch „internal field separator“ genannt. Dieser ist meist mit
# mehreren Zeichen besetzt: z. B. [[:space:]], \t (tab), \n (Zeilenumbruch) usw. Diese Zeichen trennen
# Wörter, Zeichenfolgen Variablen usw. Wird der IFS auf ein neues Zeichen beispielsweise wie im
# Beispiel von Text 6 auf den Doppelpunkt „:“ gesetzt, kann dies als Trennzeichen verwendet werden
# um die Zeile mittels „set“-Befehl an den Doppelpunktpositionen in mehrere Teilstücke zu trennen
# und diese dann als neue Positions- bzw. set-Parameter ($1 $2 $3 … ) weiter zu verarbeiten. So
# werden die Eigenschaften des Benutzers, die an das Skript übergeben wurden, separiert
# ausgegeben.