#!/bin/bash
# Datei muss mit Übergeben werden
if  [ -w  "$1" ]
then
    cat $1   |   sed   "s/[iI][sS][oO]-8859-15/UTF-8/g"   >   "/tmp/hallo$$"
    mv   "/tmp/hallo$$"   "$1"
fi
