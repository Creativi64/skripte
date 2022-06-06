#!/bin/bash
mapfile -t testarray <ips.csv

printf "%s\n" "${testarray[*]}"
echo "---"
printf "%s\n" "${testarray[@]}"
echo "---"
echo ${#testarray[*]}
echo "---"
echo ${#testarray[@]}
echo "---"
echo "${testarray[1]}"
echo "---"
echo ${#testarray[1]}
echo "---"
echo "${!testarray[*]}"
echo "---"
echo "${!testarray[@]}"
echo "---"
