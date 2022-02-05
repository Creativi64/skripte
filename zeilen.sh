#!/bin/bash
i=1
while read line
do
echo "$i. Zeile: $line"
((i=$i + 1))
done <<TEXT
Eine Zeile
`date`
Homeverzeichnis $HOME
Das Ende
TEXT