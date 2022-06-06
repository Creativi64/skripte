#!/bin/bash

Vorname="KEK"
Nachnahme="3"
SamAccName="$Vorname$Nachnahme"
OuDomain=",OU=Firma"
DnDomain=",DC=phkr,DC=int"
#Name="Test6"

KeytabFile="/home/philipp/ph.keytab"
WinexePath="/home/philipp/winexe"

DomainControler="SERVERPHKR.PHKR.INT:636"
DomainEndung="@PHKR.INT"
AdminKonto="Administrator"

{
    echo "dn: CN=$SamAccName$OuDomain$DnDomain"                                  #dn: CN=KEK2,OU=Firma,DC=phkr,DC=int
    echo "changetype: add"                                                       #changetype: add
    echo "objectClass: top"                                                      #objectClass: top
    echo "objectClass: person"                                                   #objectClass: person
    echo "objectClass: organizationalPerson"                                     #objectClass: organizationalPerson
    echo "objectClass: user"                                                     #objectClass: user
    echo "cn: $SamAccName"                                                          #cn: KEK2
    echo "sn: $Nachnahme" 
    echo "givenName: $Vorname"                                                 #givenName: KEK2
    echo "distinguishedName: CN=$SamAccName$OuDomain$DnDomain"                   #distinguishedName: CN=KEK2,OU=Firma,DC=phkr,DC=int
    echo "instanceType: 4"                                                       #instanceType: 4
    echo "displayName: $SamAccName"                                              #displayName: KEK2
    #echo "name: $SamAccName"                                                     #name: KEK2
    echo "userAccountControl: 514"                                               #userAccountControl: 514
    echo "sAMAccountName: $SamAccName"                                           #sAMAccountName: KEK2
    echo "userPrincipalName: $SamAccName@phkr.int"                           #userPrincipalName: KEK2@phkr.int 
    echo "objectCategory: CN=Person,CN=Schema,CN=Configuration$DnDomain"         #objectCategory: CN=Person,CN=Schema,CN=Configuration,DC=phkr,DC=int
    echo ""                                                                      #
    echo "dn: CN=$SamAccName$OuDomain$DnDomain"                                  #dn: CN=KEK2,OU=Firma,DC=PHKR,DC=int
    echo "changetype: modify"                                                    #changetype: modify
    echo "replace: unicodePwd"                                                   #replace: unicodePwd
    echo "unicodePwd::IgBTAHUAcABlAHIAUwBjAGgAdQBlAGwAZQByADEAMgAzACIA"          #unicodePwd::IgBTAHUAcABlAHIAUwBjAGgAdQBlAGwAZQByADEAMgAzACIA
    echo ""                                                                      # 
    echo "dn: CN=$SamAccName$OuDomain$DnDomain"                                  #dn: CN=KEK2,OU=Firma,DC=PHKR,DC=int
    echo "changetype: modify"                                                    #changetype: modify
    echo "replace: userAccountControl"                                           #replace: userAccountControl
    echo "userAccountControl: 66048"                                             #userAccountControl: 66048
    echo "-"                                                                     #-
}>> /tmp/LDAPFILE$$  

echo "----------------LDDAP-FILE-START----------------"
cat /tmp/LDAPFILE$$ 
echo "----------------LDDAP-FILE-END----------------"

echo ""
echo "Kerberos Ticket Holen"
echo "sudo kinit $AdminKonto$DomainEndung -k -t $KeytabFile"
sudo kinit $AdminKonto$DomainEndung -k -t $KeytabFile

echo "User Via Ldap File"
echo "ldapmodify -c -a -f \"/tmp/LDAPFILE$$\" -H \"ldaps://$DomainControler\" -D $AdminKonto$DomainEndung -W"
ldapmodify -c -a -f "/tmp/LDAPFILE$$" -H "ldaps://$DomainControler" -D $AdminKonto$DomainEndung -W

#Homeverzeichnis Direkt auf den Server anlegen
echo "Home Verzeichnis"
echo "$WinexePath -U \"$AdminKonto\" \"//10.200.10.1\" \"powershell c:\\Homes\\benutzerhome.ps1 $SamAccName\""
$WinexePath -U $AdminKonto "//10.200.10.1" "powershell c:\Homes\benutzerhome.ps1 $SamAccName"

#./winexe -U "Administrator" //10.200.10.1 "powershell c\; c:\Homes\benutzerhome.ps1 Test"

rm /tmp/LDAPFILE$$  