#! /bin/bash
# with groupinfo you will get the Infos of the group $1 attributes are named
# ./skript [GruppenName] [MitgliedName] [DomainAdmin] [Passwort]
groupinfo $1 "distinguishedName" $3 $4 | grep -E -i "cn=$1" > /dev/null

if [[ "$?" != "0" ]];then
    echo "DN: CN=$1,OU=Klassen,OU=Schule,DC=BSZ,DC=LOCAL" > /tmp/datei$$
    echo "changeType: add" >> /tmp/datei$$
    echo "objectClass: group" >> /tmp/datei$$
    echo "cn: $1" >> /tmp/datei$$
    echo "description: Klasse $1" >> /tmp/datei$$
    echo "sAMAccountName: $1" >> /tmp/datei$$
    echo "groupType: -2147483646" >> /tmp/datei$$
    echo "name: $1" >> /tmp/datei$$
    echo "distinguishedName: CN=$1,OU=Klassen,OU=Schule,DC=BSZ,DC=LOCAL" >> /tmp/datei$$
    echo "member:cn=$2,OU=Klassen,OU=Schule,DC=BSZ,DC=LOCAL" >> /tmp/datei$$
    echo "instanceType: 4" >> /tmp/datei$$
    echo -e "\n" >> /tmp/datei$$
    lapmodify -x -D "$3@SCHULE.LOCAL" -w "$4" -H "ldaps://Server.Schule.local:636" -f
    /tmp/datei$$
    rm /tmp/datei$$
fi