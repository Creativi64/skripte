#! /bin/bash
if [[ $# -lt 10 ]]; then

    echo "Du Döddele solltest doch mindestens 11 Parameter übergeben"
else
    echo "$@"
    z=$# # Es wird die Variable z mit dem Inhalt von $# gefüllt z.B. 15

    
    while ((0 < $#)); do


        
        # echo "\$1=$1"
        felder[$#]=$1 # felder[15]=1
        # nach dem ersten Durchlauf
        # felder[15]=1 Bei Übergabe von: 1 2 …. 8 9 A B .. E F
        # zweiter Durchlauf
        # felder[14]=2 als Set-Parameter
        # ...
        # felder[1]=F
        shift
    done
    
    # echo "------------------------"
    # echo "------------------------"
    # echo -e "rueckwaerts: \c"
    i=0
    
    while ((i < z)); do
        
        ((i = i + 1))
        echo "$i"
        echo "${felder[$i]}"
        echo "feld[$i] = ${felder[$i]}"

        # echo -e "${felder[$i]} \c"

        # das array wird rückwärtz abgespult

    done
    echo " ende"
fi

#Das Programm reht die Übergabe parameter einmalum