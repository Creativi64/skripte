#!/bin/bash

#Ohne / nach den << werde die variablen Gelsen
cat <<ENDE_EINLESEN
Heute ist $(date),
Sie befinden Sie im Verzeichnis $(pwd). Ihr

aktuelles Terminal ist $(echo -n "$TERM") und
Ihr Heimatverzeichnis finden Sie unter dem Pfad: $HOME.
ENDE_EINLESEN

# aktuelles Terminal ist `echo -n $TERM` und

echo "#########################################################"

#mit / nach den << werde die variablen nicht Gelsen
cat <<\ENDE_EINLESEN
Heute ist `date`,
Sie befinden Sie im Verzeichnis `pwd`. Ihr
aktuelles Terminal ist `echo -n $TERM` und
Ihr Heimatverzeichnis finden Sie unter dem Pfad: $HOME.
ENDE_EINLESEN

# Der „cat“-Befehl dient zum anneinanderbinden mehrerer Einzeldateien. Diese gibt der
# Befehl über die Standard-Ausgabe „1>“ auf die Konsole aus. Durch ein nachfolgendes
# Umleitungszeichen „>“ kann im regulären Gebrauch des Befehls eine neue Datei mit allen
# Inhalten der gelisteten Dateien erzeugt werden.
# Jedoch in obigem Beispiel wird an Stelle einer Datei der Text, der dem cat-Befehl
# nachfolgt, bis zur Textmarke „ENDE_EINLESEN“ von „cat“ eingelesen und ausgegeben.
# Da im Text selbst Befehle als Substitutionen „`“ (BACK-TICKS) hinterlegt sind, werden
# diese zuvor noch ausgeführt, so dass die Ausgabe das Ergebnis der Befehle darstellt.