# Winexe

# Befehl Ausfüren

winexe -U "[UserName]%[Passwort]" //[RemotePc] "cmd /c; $[Befehl]"

# Konsolen access
winexe -U "[UserName]%[Passwort]" //[RemotePc] "cmd"

# Domain user erstellen

net user [Name] [passwort] /add /domain

net user Firtz2 Hallo123! /add /domain

# Domain Objekt-DN bekommen

## Name einen nutzers
dsquery user -name "[Name]"

## Name einer Orgnisazion unit
dsquery ou -name "[Name]"

dsquery user -name "Firtz2"


# Domain User verschieben

dsmove "[NutzerDN/ObektDesZuBewegenden]" -newparent "[OuDN/ObjektDesNeuenParents]"

dsmove "CN=Firtz2,CN=Users,DC=kreuzerKekNETWORK,DC=de" -newparent "OU=Firma,DC=kreuzerKekNETWORK,DC=de"

## Combine

dsmove (dsquery user -name "Müller") -newparent (dsquery ou -name "Firma")

# Nutzer samt Mitgliedschaft in Gruppen und organistation Erstellen

dsadd user ["NutzerDN\CN=[Name],CN=[OU/ortnaisationUnit],DC=[Domain],DC=[TDL/Endung]"]  -fn ["Vorname"] -ln["Nachname"] -display["Anzeigename"] -desc["BEschreibung"] -pwd["Passwort"] -memberof ["GruppenDN"]

dsadd user "CN=test1,CN=Users,DC=kreuzerKekNETWORK,DC=de"  -fn "test1" -ln "testa" -display "Test1" -desc "Test acc" -pwd "*" -memberof "CN=G_Rechnung,OU=Firma,DC=kreuzerKekNETWORK,DC=de"

# dinge Gruppen hinzuzufügen

dsmod group ["GruooenDN"] { [-addmbr -> hinzufügen] [-rmmbr ->entfernen] [-chmbr ->Ändern] } ["[UserDN]"]

dsmod group (dsquery group -name "G_Rechnung") -addmbr (dsquery user -name "Firtz2")

# Neues Home verzeichnis anlgenen


# Home verzeicnis hinzufügen

https://activedirectoryfaq.com/2017/09/powershell-create-home-directory-grant-permissions/

set-ADUser "Müller" -HomeDrive "H" -HomeDirectory "\\Server\Homes\Müller"


# ADDS nutzer gruppen mitgliedschaften abfragen

## Normal abfrage

dsget user (dsquery user -name "[Name]") -memberof

dsget user (dsquery user -name "Müller") -memberof

## extendet abfragen

dsget user (dsquery user -name "[Name]") -memberof -expand

dsget user (dsquery user -name "Müller") -memberof -expand
# Dateien Suchen
s
find / -name [NameDerDatei]

# SetAcl Von Helge Klein

Die Exe installieren


# LDAP

ldapsearch -x -LLL -D"Fritz@kreuzerkeknet.de" -W -b \ "OU=Firma,DC=kreuzerKekNETWORK,DC=de" -H "ldap://10.200.10.1:389"

<https://helgeklein.com/download/>