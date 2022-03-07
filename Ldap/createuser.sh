#!/bin/bash

Name="Test5"
{
    echo "dn: CN=$Name,OU=Firma,DC=PHKR,DC=int"                                  #dn: CN=KEK2,OU=Firma,DC=phkr,DC=int
    echo "changetype: add"                                                       #changetype: add
    echo "objectClass: top"                                                      #objectClass: top
    echo "objectClass: person"                                                   #objectClass: person
    echo "objectClass: organizationalPerson"                                     #objectClass: organizationalPerson
    echo "objectClass: user"                                                     #objectClass: user
    echo "cn: $Name"                                                             #cn: KEK2
    echo "givenName: $Name"                                                      #givenName: KEK2
    echo "distinguishedName: CN=$Name,OU=Firma,DC=phkr,DC=int"                   #distinguishedName: CN=KEK2,OU=Firma,DC=phkr,DC=int
    echo "instanceType: 4"                                                       #instanceType: 4
    #whenCreated: 20220215121859.0Z
    #whenChanged: 20220215121859.0Z
    echo "displayName: $Name"                                                    #displayName: KEK2
    echo "name: $Name"                                                           #name: KEK2
    echo "userAccountControl: 514"                                               #userAccountControl: 514
    #countryCode: 0
    echo "sAMAccountName: $Name"                                                 #sAMAccountName: KEK2
    echo "userPrincipalName: $Name@phkr.int"                                     #userPrincipalName: KEK2@phkr.int 
    echo "objectCategory: CN=Person,CN=Schema,CN=Configuration,DC=phkr,DC=int"   #objectCategory: CN=Person,CN=Schema,CN=Configuration,DC=phkr,DC=int
    echo ""                                                                      #
    echo "dn: CN=$Name,OU=Firma,DC=PHKR,DC=int"                                  #dn: CN=KEK2,OU=Firma,DC=PHKR,DC=int
    echo "changetype: modify"                                                    #changetype: modify
    echo "replace: unicodePwd"                                                   #replace: unicodePwd
    echo "unicodePwd::IgBTAHUAcABlAHIAUwBjAGgAdQBlAGwAZQByADEAMgAzACIA"          #unicodePwd::IgBTAHUAcABlAHIAUwBjAGgAdQBlAGwAZQByADEAMgAzACIA
    echo ""                                                                      # 
    echo "dn: CN=$Name,OU=Firma,DC=PHKR,DC=int"                                  #dn: CN=KEK2,OU=Firma,DC=PHKR,DC=int
    echo "changetype: modify"                                                    #changetype: modify
    echo "replace: userAccountControl"                                           #replace: userAccountControl
    echo "userAccountControl: 66048"                                             #userAccountControl: 66048
    echo "-"                                                                     #-
}>> /tmp/LDAPFILE$$  

cat /tmp/LDAPFILE$$ 

ldapmodify -c -a -f "/tmp/LDAPFILE$$" -H "ldaps://SERVERPHKR.PHKR.INT:636" -D Administrator@PHKR.INT -W

#Homeverzeichnis Direkt auf den Server anlegen

./winexe -U "Administrator" //10.200.10.1 "powershell c:\Homes\benutzerhome.ps1 $Name"
#./winexe -U "Administrator" //10.200.10.1 "powershell c\; c:\Homes\benutzerhome.ps1 Test"

