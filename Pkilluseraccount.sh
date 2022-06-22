#!/bin/bash 

if [[ $1 == "" ]]; then
    echo "Kein user"    
    exit 1
fi
mkdir "/home/backups/$1"

deluser --remove-home --remove-all-files --backup --backup-to "/home/backups/$1" $1

#cp -r "/home/$1" "/home/backups/$1/HomeDir"
#cp "/home/austausch/" "/home/backups/$1/Austausch"

setfacl -Rbm "u::---" "/home/backups/$1"

setfacl -Rbm "u:root:r-x" "/home/backups/$1"

