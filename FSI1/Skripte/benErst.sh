#!/bin/bash

DATEI="$1"
mapfile -n 0 ZEILEN < "$DATEI"
for((i=0; i<$(echo ${#ZEILEN[*]});i++))
do  
    echo $i ${ZEILEN[$i]}
done