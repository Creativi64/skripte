#!/bin/bash

readarray -t testarray < CSV/schulaufgabe.csv

echo ${testarray[$1]} | cut -d ',' -f $2