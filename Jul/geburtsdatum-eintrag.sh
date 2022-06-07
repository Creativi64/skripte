#!/bin/bash
dialog --inputbox "Bitte geben Sie das Geburtsdatum in Form ein: 28/06/1990"  \
        0 0  2> /tmp/hallo$$
if  [  "$?" == "0"  ]
    then
    Datum=$(cat /tmp/hallo$$)
    dialog --inputbox "Bitte geben Sie den Namen zum  Geburtsdatum ein:" \
                    0 0  2> /tmp/hallo$$
    if   [  "$?"  ==  "0"  ]
    then
        name=$(cat /tmp/hallo$$)
    else
        echo "Fehler"
        exit
    fi
    fi
echo "$Datum $name"     >> ./geburtstagsliste.txt
if  [  -w /tmp/hallo$$  ]
    then
    rm /tmp/hallo$$
fi
