#!/bin/bash
echo "Start"
if   grep -E "$(date +%d/%m/)"    ./geburtstagsliste.txt   >   /tmp/hallo$$.txt;then
   
    set $(cat /tmp/hallo$$.txt ) #wir müssen splitten also kein "" 
    Datum="$1"
    shift

    Namenszug=("$@")
    #echo "${Namenszug[@]}"
    IFSBACK="$IFS"
    IFS="/" 
    set $Datum #wir müssen splitten also kein ""  und da jetzt der ifs / ist wird das datum auf die plätze 1 2 und 3 gesplitted
    
    Jahr=$(date "+%Y") 
    
    ((i=Jahr- $3 )) # Arimetische rechnung ist kein $ gebraucht und $3 von dem aktuellen jahr abgezogen
    
    echo -e "${Namenszug} hat heute Geburtstag! - Sie oder Er wird heute \c"
    echo " $i Jahre alt!"
    IFS="$IFSBACK"
fi
echo "End"
 