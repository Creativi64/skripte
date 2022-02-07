#!/bin/bash
readarray -t testarray < ips.csv

echo ${testarray[*]}
echo "---"
echo ${testarray[@]}
echo "---"
echo ${#testarray[*]}
echo "---"
echo ${#testarray[@]}
echo "---"
echo ${testarray[1]}
echo "---"
echo ${#testarray[1]}
echo "---"
echo ${!testarray[*]}
echo "---"
echo ${!testarray[1]}
echo "---" 
