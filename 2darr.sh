#!/bin/bash
readarray -t testarray < ips.csv

echo ${#testarray[@]}
echo ${#testarray[*]}
echo "--"
echo "${testarray[1]}"
echo ${#testarray[1]}

if [ $1 -gt ${#testarray[@]} ]

then

echo "erster übergabeparameter zu groß"

exit 0

fi

if [ $2 -gt "$(echo ${#testarray} | grep -o "." | wc -l)" ]

then

echo "zweiter übergabeparameter zu groß"

exit 0

fi

echo ${testarray[$1]} | cut -d '.' -f $2