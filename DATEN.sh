#!/bin/bash

function displaytime {
  local T=$1
  local D=$((T/60/60/24))
  local H=$((T/60/60%24))
  local M=$((T/60%60))
  local S=$((T%60))
  (( $D > 0 )) && printf '%d days ' $D
  (( $H > 0 )) && printf '%d hours ' $H
  (( $M > 0 )) && printf '%d minutes ' $M
  (( $D > 0 || $H > 0 || $M > 0 )) && printf 'and '
  printf '%d seconds\n' $S
}
echo $(date)


echo $(date +%H:%M)

echo $(date +%D)

echo $(date +%d.%m.%y)

echo $(( ($(date --date="210622" +%s) - $(date --date="210622" +%s) )/(60*60*24) ))

echo $(date --date '2017-08-17 04:00:01' +%s)

timespam1=$(date --date '2017-08-17 04:00:01' +%s)
timespam2=$(date --date '2017-08-18 05:00:01' +%s)

echo "$timespam1"
echo "$timespam2"

diff=$(echo "$timespam2-$timespam1" |bc )

echo "$diff"

displaytime "$diff"

#gdf=$(date --date "@${timespam1}")
#echo "$gdf"


