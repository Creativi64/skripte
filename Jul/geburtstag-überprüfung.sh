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
    set $Datum #wir müssen splitten also kein ""  
    
    Jahr=$(date "+%Y") 
    
    ((i=Jahr- $3 )) # Arimetische rechnung ist kein $ gebraucht
    echo -e "${Namenszug} hat heute Geburtstag! - Sie oder Er wird heute \c"
    echo " $i Jahre alt!"
    IFS="$IFSBACK"
fi
echo "End"
 