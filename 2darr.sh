#!/bin/bash
readarray -t testarray < CSV/schulaufgabe.csv

if [ $1 -gt ${#testarray[@]} ]

then

echo "erster übergabeparameter zu groß"

exit 0

fi

if [ $2>5 ]

then

echo "zweiter übergabeparameter zu groß"

exit 0

fi

echo ${testarray[$1]} | cut -d ',' -f $2