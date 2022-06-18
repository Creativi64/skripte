#!/bin/bash
# [Verzeichnis1] [ Verzeichnis 2]
# verglicht zwei verzeichnise
echo "Start"
if [[ "" == "$1$2" ]];then
    echo "Es fehlen 2 Übergabe-Parameter z.B.: /Verzeichnis1 /Verzeichnis2 !"
else

    for f in $1/* ;do
        # Diese Zeile:" test -e $2/${f##*/} || echo $f " oder:
        
        datei1=$f
        while echo "$datei1" | grep -E "/" > /dev/null;do
          
            datei1a=$(echo "$datei1" | cut -d"/" -f2-)
            datei1=$datei1a 
        done
        if [[ -e $2/$datei1 ]];then
            ## tue nichts ist Doppelpunkt
            :
        else
            echo "Das Objekt $datei1 existiert nicht in $2"
        fi
    done
fi

echo "Ende"
