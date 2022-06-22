#!/bin/bash 

function ISTVOL() {
 
    IFS="."
    set $1
    IFS=" "
    if [[ ${#1} -lt 2 ]]; then
        Tag="0$1"
    else
        Tag="$1"
    fi
    if [[ ${#2} -lt 2 ]]; then
        Monat="0$2"
    else
        Monat="$2"
    fi
    if [[ ${#3} -lt 4 ]]; then
        if [[ $3 -gt $(date "+%y") ]]; then
            Jahr="19$3"
        else
            Jahr="20$3"
        fi
    else
        Jahr="$3"
    fi
    echo "Tag: $Tag Monat: $Monat Jahr: $Jahr"
    ((erwachsen = 18 + ${Jahr}))

    volljaehrig=$(date --date "${erwachsen}${Monat}${Tag}" "+%s")
    echo "\$volljaehrig=$volljaehrig"
    heute2=$(date "+%s")
    echo " heute =$heute2"
    ## Ist das Geburtsdatum ein gültiges Datum?
    case $Monat in
    "1" | "01" | "3" | "03" | "5" | "05" | "7" | "07" | "8" | "08" | "10" | "12")

        #### echo "31 Tage $Tag $Monat $Jahr ${heute2} ${Datum2}"
        if [[ "$Tag" > "00" && $Tag < 32 ]]; then
            if [[ $volljaehrig < $heute2 ]]; then
                echo "-------------------------------"
                echo "Sie sind volljährig!"
                echo "-------------------------------"
                exit 1
                Pruefung="0"
            else
                Pruefung="1"
                echo "-------------------------------"
                echo "Sie sind noch nicht volljährig!"
                echo "-------------------------------"
                exit 0
            fi
        else
            echo "###############################"
            echo "falsche Datumsangabe"
            Pruefung="2"
            echo "###############################"

        fi
        ### echo "PR= $Pruefung"
        ;;
    "4" | "04" | "6" | "06" | "9" | "09" | "11")
        # echo "30 Tage"
        if [[ "$Tag" -gt "00" && "$Tag" -lt "31" ]]; then
            if [[ "${volljaehrig}" -lt "${heute2}" ]]; then
                Pruefung="0"
            else
                echo "-------------------------------"
                echo "Sie sind noch nicht volljährig!"
                echo "-------------------------------"
                Pruefung="1"
                exit 0
            fi
        else
            echo "###############################"
            echo "falsche Datumsangabe"
            Pruefung="2"
            echo "###############################"
        fi
        ;;
    "2" | "02")
        #echo "28/29 Tage"
        if [[ "$Tag" -gt "00" && "$Tag" -lt "30" ]]; then
            ((rest = ${Jahr} % 4))
            ((restjahrhundert = ${Jahr} % 1000))
            #echo "$rest $restjahrhundert"
            if [[ "$Tag" -eq "29" && "$rest" -eq "0" && "$restjahrhundert" != "0" ]]; then
                if [[ "${volljaehrig}" -lt "${heute2}" ]]; then
                    Pruefung="0"
                    echo "-------------------------------"
                    echo "Sie sind volljährig!"
                    echo "-------------------------------"
                    exit 1
                else
                    echo "-------------------------------"
                    echo "Sie sind noch nicht volljährig!"
                    echo "-------------------------------"
                    Pruefung="1"
                    exit 0
                fi
            else
                if [[ $Tag -lt "29" && "${volljaehrig}" -lt "${heute2}" ]]; then
                    echo "-------------------------------"
                    echo "Sie sind volljährig!"
                    echo "-------------------------------"
                    Pruefung="0"
                    exit 1
                else
                    echo "-------------------------------"
                    echo "Sie sind noch nicht volljährig!"
                    echo "-------------------------------"
                    Pruefung="1"
                    exit 0
                fi
            fi
        else
            echo "#########################################"
            echo " Ihre Eingabe ist absolut falsch!"
            echo "#########################################"
            Pruefung="3"
        fi
        ;;
    *)
        echo "#########################################"
        echo " Ihre Eingabe ist absolut falsch!"
        echo "#########################################"
        Pruefung="3"
        ;;
    esac
      
}

if [[ $1 == "" ]]; then
    echo "kein user"
    exit 3
fi
USER=$1
mapfile -t < "./benutzer.csv"
#echo "#########--- print mapfile ---####################"
#printf "%s" "${MAPFILE[@]}"
echo "--"
#echo ${MAPFILE[0]}
#echo ${MAPFILE[2]}

BACKIFS="$IFS" 

for item in ${MAPFILE[@]}; do
    IFS=";"
    sed $item #split 
    echo "${item}"
    if [[ $1 == $USER ]]; then
         
         echo $4
        if [[ "0" == $(ISTVOL $4)]] ;then
         exit 0
         else
         exit 1
         fi
    fi
done



