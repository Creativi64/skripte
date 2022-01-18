#!/bin/bash
sshpass -p "123" ssh cannabis@192.168.179.32 "df -h"
echo "Ende" 
#rsync -av ./Text.txt ./backup

rsync -avv -e "sshpass -p '123' ssh -j cannabis@192.168.179.32" ./Text.txt /home/cannabis/
datum=$(date +%d-%m-%y--%H:%M:%S)
echo  "$datum"