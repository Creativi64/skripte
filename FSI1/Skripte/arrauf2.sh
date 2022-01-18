#!/bin/bash

echo "#---------------------------------------------"
echo "# Erläutere und erkläre das Beispiel "
echo "# hier so ausführlich wie nur möglich! "
echo "# Verfasse hierzu #Anmerkungen im Skript! "
echo "# Welche Übergabewerte als PArameter er- "
echo "# scheinen Ihnen sinnvoll? "
echo "---------------------------------------------"
echo "# \$1=\"Hallo Egon Egon\" "
echo "starte das Skript mal z. B. mit: arrayuebung01 HalloHallo EgonEgon"
if [[ $# == 0 ]]; then #wenn der wert 0 ist wird er auf "hallo hallo egon egon" gesetzt++
    set "Hallo1 Hallo2 Egon1 Egon2"
fi

Name="$1" #die erste eingabe wird als Name festgelegt
echo "--------------------"
echo $"$1"
echo $"$2"
echo $"$3"
echo "--------------------"
Begruessung="${Name%Egon}" #Entfernt das muster "Egon" nach rechts als kelinste passenden stück
echo "Hier folgt die Begruessung $Begruessung"
echo "---------------------------------------------"
echo "Der Befehl: echo \"\$1\" | sed \"s/Egon//\" hat "
echo " die geliche Funktion"
echo "---------------------------------------------"
echo "\${Name%%Egon} ergibt: ${Name%%Egon}"
echo "---------------------------------------------"
echo "\$Name#Hallo} ergibt: ${Name#Hallo}"
echo "---------------------------------------------"
echo "\${Name##Hallo} ergibt: ${Name##Hallo}"
echo "---------------------------------------------"
echo "\${1:-15} ergibt: ${1:-15}"
echo "---------------------------------------------"
echo "Bedenke \$7 und \$8 wurde nicht gestzt!"
echo "---------------------------------------------"
echo "\$7 ist jetzt: ${7:-15} und nicht ${8:--9}"
echo "---------------------------------------------"
echo "Fritz" | tr '[:upper:]' '[:lower:]'
