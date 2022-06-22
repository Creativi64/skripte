#!/bin/bash 

BENUTZER=$(dialog --inputbox "Benutzernamen"   10 50 3>&1 1>&2 2>&3)

users=$(grep -E ":[0-9][0-9][0-9][0-9]:" "/etc/group")

echo "$users"
BACKIFS="$IFS" 

echo "---"

POSIBGROUBS=""

for item in ${users}; do
    IFS=:
    set $item #split 
    echo $1
    echo $3  
    POSIBGROUBS="$POSIBGROUBS $3 $1 -"
    #echo "${item}"
done 
IFS="$BACKIFS"

grup=$(dialog --buildlist "test" 10 50 3 $POSIBGROUBS 3>&1 1>&2 2>&3)
echo "---"
echo $grup
echo "---"

usermod -a -G $grup $BENUTZER


#systemd-coredump:x:999:
#tes:x:1001:
#test2:x:1002:
#_ssh:x:114:
#sgx:x:130:
#openvpn:x:131:
#test:x:1004: