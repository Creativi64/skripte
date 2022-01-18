#!/bin/bash
FILE=./switch
# jobs "$0" bg
if test -f "$FILE"; then
    switch=false
else
    switch=true
fi

while $switch true; do
    {

        echo -e "$Zahl - Test"
        Zahl=$((Zahl + 1))
        sleep 1
    }
done
echo "Beendet"
