#!/bin/bash

# 7. Aufgabe
# Testen Sie die beiden Befehle: “echo $TERM“
# und “infocmp“!
# Welche Ausgaben erhalten Sie

echo $TERM

infocmp -1

# Der erste Befehl gibt an mit welchem Typ Terminal Sie arbeiten,
# während der zweite Befehl die Escape-Sequenzen ausgibt, die
# z. B. den Funktionstasten zugeordnet sind!

# 8. Aufgabe

# Sie wollen ein Passwort unsichtbar eingeben. Hierzu verwenden Sie “stty“. Welche
# Befehlsfolge schaltet die Darstellung der Eingabe ab und welche wieder an?
stty -echo
read password

stty echo
echo $password
# Der Befehl zum Einschalte lautet: “stty -echo“ und zum nAbschalten “stty echo“da
# Die Befehlsfolge lautet z. B.: #!/bin/bash; stty -echo; read passwort; stty echo;