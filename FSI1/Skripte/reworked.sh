#!/bin/bash
echo -e "Bitte geben Sie Ihr Geburtsdatum ein: \c"
read gebdatum
if echo "$gebdatum" | egrep "^[0-9]{1,2}\.[0-9]{1,2}\.([0-9]{2}){1,2}$" >/dev/null; then
    IFS="."
    set $gebdatum
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
                Pruefung="0"
            else
                Pruefung="1"
                echo "-------------------------------"
                echo "Sie sind noch nicht volljährig!"
                echo "-------------------------------"
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
                else
                    echo "-------------------------------"
                    echo "Sie sind noch nicht volljährig!"
                    echo "-------------------------------"
                    Pruefung="1"
                fi
            else
                if [[ $Tag -lt "29" && "${volljaehrig}" -lt "${heute2}" ]]; then
                    echo "-------------------------------"
                    echo "Sie sind volljährig!"
                    echo "-------------------------------"
                    Pruefung="0"
                else
                    echo "-------------------------------"
                    echo "Sie sind noch nicht volljährig!"
                    echo "-------------------------------"

                    Pruefung="1"
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
    if [[ "$Pruefung" -eq "0" ]]; then
        echo "#-------------------------------------------------"
        echo "Sie wurden/werden im Jahr $erwachsen volljährig!"
        echo "Beachten Sie den Befehl: "
        echo "date --date \"\$Jahr\$Monat\$Tag \$Stunde:\$Minutew:\$Sekunde\" und optional: \"+%s\""
        echo "Wenn Sie 18 Jahre alt "
        echo "sind, sind Sie in Unix-Sekunden älter als $volljaehrig!"
        echo "Der Zeitpunkt heute u. jetzt in Unix-Sekunden: $heute2"
        echo "Sie sind volljährig!"
        echo "Sie dürfen hier rein!"
    else
        echo "Sie sind noch nicht volljährig!"
        echo "-oder haben ein ungültiges Datum eingegeben!"
        echo "Sie dürfen hier nicht rein!"
        echo "Error-Code: $Pruefung "
        echo "###############################################"
    fi
else
    echo "###############################################"
    echo " falsche Eingabe"
    echo " Bitte wiederholen Sie Ihre Eingabe!"
    echo "###############################################"
fi
echo "#---------------------------------------------------"
