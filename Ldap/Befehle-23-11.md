
IANA hat Obejkt ID festgelegt

internet assingen numbers authority



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

dsadd user ["NutzerDN\CN=[Name],CN=[OU/ortnaisationUnit],DC=[Domain],DC=[TDL/Endung]"] -fn ["Vorname"] -ln["Nachname"] -display["Anzeigename"] -desc["BEschreibung"] -pwd["Passwort"] -memberof ["GruppenDN"]

dsadd user "CN=test1,CN=Users,DC=kreuzerKekNETWORK,DC=de" -fn "test1" -ln "testa" -display "Test1" -desc "Test acc" -pwd "\*" -memberof "CN=G_Rechnung,OU=Firma,DC=kreuzerKekNETWORK,DC=de"

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

# Warum keine User in Der add Löschen

die Security id kannn nach einem backup nicht wieder eingelsen werden
des wegen ist es vorteil hast user fürs erste zu deaktivieren bis man sie komplett löscht

## ldif

ldifde -r "(objectClass=User)" -l "objectSID" -f ".\backup.ldf" -d "CN=[UserNAme],OU=[Unit],DC=[Domain],DC=[TDL]"

## User

## isntall

sudo apt-get install ldapscripts

## suchen

ldapsearch -x -LLL -D"Fritz@kreuzerkeknet.de" -W -b \ "OU=Firma,DC=kreuzerKekNETWORK,DC=de" -H "ldap://10.200.10.1:389"

> erfordert Kreberos ticket

ldapsearch -x -LLL -D "Administrator@kreuzerkeknetwork.de" -W -b "CN=Users,DC=KreuzerKekNETWORK,DC=de" -s sub -H "ldap://10.200.10.1:389" "(&(sAMAccountType=805306368)(sn=Fritz)(sAMAccountName~=Fritz*))" "*"

ldapsearch -x -LLL -D "Administrator@kreuzerkeknetwork.de" -W -b "OU=Firma,CN=Users,DC=KreuzerKekNETWORK,DC=de" -s sub -H "ldap://10.200.10.1:389" "(&(sAMAccountType=805306368)(sAMAccountName=Fr*))" "*"

dapsearch -x -LLL -D "Administrator@kreuzerkeknetwork.de" -W -b "OU=Firma,DC=KreuzerKekNETWORK,DC=de" -s sub -H "ldap://10.200.10.1:389" "(&(sAMAccountType=805306368)(sAMAccountName=Fr\*))" "sAMAccountName"

---

ldapsearch -x -b "DC=Test,DC=local" -H "ldap://192.168.179.71"

ldapsearch -x -LLL -D "Administrator@Test.local" -W -b "DC=Test,DC=local" -H "ldap://192.168.179.71" "(&(sAMAccountType=805306368)(sn=Fritz)(sAMAccountName~=Fritz*))" "*"

ldapsearch -x -LLL -D "Administrator@Test.local" -W -b "DC=Test,DC=local" -H "ldap://192.168.179.71" "(&(sAMAccountType=805306368))" "*"

ldapsearch -x -LLL -D "Administrator@PHKR.INT" -W -b "OU=Firma,DC=phkr,DC=int" -H "ldap://PHKR.INT" -s sub "(&(sAMAccountType=805306368))" "*"

## User Export

ldifde -m -f "c:\backup.ldf" -r "(objectClass=user)" -d "Dc=KreuzerKekNETWORK,dc=de" -u

## import

ldifde -i -f "c:\backup.ldf" -u

## bei import ändern

dn: CN=Fritz,OU=Firma,DC=kreuzerKekNETWORK,DC=de\
changetype: modify\
replace: sAMAccountName\
sAMAccountName: [NewName]

\-

ldapmodify -x -c -a -f "backuploadpas.ldif" -H "ldap://10.200.10.1" -D Administrator@kreuzerkeknetwork.de -W

ldapmodify -x -c -a -f "backuploadpas.ldif" -H "ldap://10.200.10.1" -D Administrator@PHKR.INT -W

<http://pig.made-it.com/pig-adusers.html>

## Port scanen

nmap -P0 -p 636 phkr.int

## PAWWORT SETZEN Können

ldapmodify -v -x -c -a -f "backuploadpas.ldif" -H "ldaps://SERVERPHKR.PHKR.INT" -D Administrator@PHKR.INT -W

ldapmodify -v -x -c -a -f "backuploadpas2.ldif" -H "ldaps://SERVERPHKR.PHKR.INT" -D Administrator@PHKR.INT -W
# User Erstelle mit Unicode PWD

Passwort: "SuperSchueler123"

Passwort erstellen mit

```bash
 echo -n "\"[Passwort]\"" | iconv -f UTF8 -t UTF16LE | base64 -w 0
 ```

```bash
 echo -n "\"SuperSchueler123\"" | iconv -f UTF8 -t UTF16LE | base64 -w 0
 ```
## File

```ldif
dn: CN=Test,OU=Firma,DC=PHKR,DC=int
changetype: add
accountExpires: 9223372036854775807
cn: Test
codePage: 0
countryCode: 0
displayName: Test
distinguishedName: CN=Test,OU=Firma,DC=PHKR,DC=int
dSCorePropagationData: 16010101000000.0Z
givenName: Test
sAMAccountName: Test
#userAccountControl: 514
userPrincipalName: Test@PHKR.int
uSNChanged: 45341
uSNCreated: 45336
whenChanged: 20211116110306.0Z
whenCreated: 20211116110306.0Z
userPassword: Hallo123!
userAccountControl: 544

dn: CN=Test,OU=Firma,DC=PHKR,DC=int
changetype: modify
replace: unicodePwd
unicodePwd::IgBTAHUAcABlAHIAUwBjAGgAdQBlAGwAZQByADEAMgAzACIA

dn: CN=Test,OU=Firma,DC=PHKR,DC=int
changetype: modify
replace: userAccountControl
userAccountControl: 512
-name: Test
objectCategory: 
 CN=Person,CN=Schema,CN=Configuration,DC=PHKR,DC=int
objectClass: top
objectClass: person
objectClass: organizationalPerson
objectClass: user
sAMAccountName: Test
#userAccountControl: 514
userPrincipalName: Test@PHKR.int
uSNChanged: 45341
uSNCreated: 45336
whenChanged: 20211116110306.0Z
whenCreated: 20211116110306.0Z
userPassword: Hallo123!
userAccountControl: 544

dn: CN=Test,OU=Firma,DC=PHKR,DC=int
changetype: modify
replace: unicodePwd
unicodePwd::IgBTAHUAcABlAHIAUwBjAGgAdQBlAGwAZQByADEAMgAzACIA

dn: CN=Test,OU=Firma,DC=PHKR,DC=int
changetype: modify
replace: userAccountControl
userAccountControl: 512
-

```

```ldif
dn: CN=KEK2,OU=Firma,DC=phkr,DC=int
changetype: add
objectClass: top
objectClass: person
objectClass: organizationalPerson
objectClass: user
cn: KEK2
givenName: KEK2
distinguishedName: CN=KEK2,OU=Firma,DC=phkr,DC=int
instanceType: 4
whenCreated: 20220215121859.0Z
whenChanged: 20220215121859.0Z
displayName: KEK2
name: KEK2
userAccountControl: 514
countryCode: 0
sAMAccountName: KEK2
userPrincipalName: KEK2@phkr.int
objectCategory: CN=Person,CN=Schema,CN=Configuration,DC=phkr,DC=int

dn: CN=KEK2,OU=Firma,DC=PHKR,DC=int
changetype: modify
replace: unicodePwd
unicodePwd::IgBTAHUAcABlAHIAUwBjAGgAdQBlAGwAZQByADEAMgAzACIA

dn: CN=KEK2,OU=Firma,DC=PHKR,DC=int
changetype: modify
replace: userAccountControl
userAccountControl: 66048
-


```

## Befehl

ldapmodify -c -a -f "backuploadpas.ldif" -H "ldaps://SERVERPHKR.PHKR.INT:636" -D Administrator@PHKR.INT -W

## LInks

<http://woshub.com/password-policy-active-directory/>

<http://pig.made-it.com/pig-adusers.html>
# Kreberos Ticket Bekommen

apt-get install krb5-user

<http://www.itadmintools.com/2011/07/creating-kerberos-keytab-files.html>

## Kerberos Datei Linix

/etc/krb5.conf

```bash
 [libdefaults]

default_realm = PHKR.INT
	#krb4_config = /etc/krb.conf
	#krb4_realms = /etc/krb.realms
	# The following krb5.conf variables are only for MIT Kerberos.
kdc_timesync = 1
ccache_type = 4
forwardable = true
proxiable = true
dns_lookup_realm = true
dns_lookup_kdc = true

# The following encryption type specification will be used by MIT Kerberos
# if uncommented.  In general, the defaults in the MIT Kerberos code are
# correct and overriding these specifications only serves to disable new
# encryption types as they are added, creating interoperability problems.
#
# The only time when you might need to uncomment these lines and change
# the enctypes is if you have local software that will break on ticket
# caches containing ticket encryption types it doesn't know about (such as
# old versions of Sun Java).

#	default_tgs_enctypes = des3-hmac-sha1
#	default_tkt_enctypes = des3-hmac-sha1
#	permitted_enctypes = des3-hmac-sha1

# The following libdefaults parameters are only for Heimdal Kerberos.
	fcc-mit-ticketflags = true

[realms]
	PHKR.INT={
		kdc = SERVERPHKR.PHKR.INT
		admin_server = SERVERPHKR.PHKR.INT
		default_domain = PHKR.INT
	}
	ATHENA.MIT.EDU = {
		kdc = kerberos.mit.edu
		kdc = kerberos-1.mit.edu
		kdc = kerberos-2.mit.edu:88
		admin_server = kerberos.mit.edu
		default_domain = mit.edu
	}
	ZONE.MIT.EDU = {
		kdc = casio.mit.edu
		kdc = seiko.mit.edu
		admin_server = casio.mit.edu
	}
	CSAIL.MIT.EDU = {
		admin_server = kerberos.csail.mit.edu
		default_domain = csail.mit.edu
	}
	IHTFP.ORG = {
		kdc = kerberos.ihtfp.org
		admin_server = kerberos.ihtfp.org
	}
	1TS.ORG = {
		kdc = kerberos.1ts.org
		admin_server = kerberos.1ts.org
	}
	ANDREW.CMU.EDU = {
		admin_server = kerberos.andrew.cmu.edu
		default_domain = andrew.cmu.edu
	}
        CS.CMU.EDU = {
                kdc = kerberos-1.srv.cs.cmu.edu
                kdc = kerberos-2.srv.cs.cmu.edu
                kdc = kerberos-3.srv.cs.cmu.edu
                admin_server = kerberos.cs.cmu.edu
        }
	DEMENTIA.ORG = {
		kdc = kerberos.dementix.org
		kdc = kerberos2.dementix.org
		admin_server = kerberos.dementix.org
	}
	stanford.edu = {
		kdc = krb5auth1.stanford.edu
		kdc = krb5auth2.stanford.edu
		kdc = krb5auth3.stanford.edu
		master_kdc = krb5auth1.stanford.edu
		admin_server = krb5-admin.stanford.edu
		default_domain = stanford.edu
	}
        UTORONTO.CA = {
                kdc = kerberos1.utoronto.ca
                kdc = kerberos2.utoronto.ca
                kdc = kerberos3.utoronto.ca
                admin_server = kerberos1.utoronto.ca
                default_domain = utoronto.ca
	}

[domain_realm]
	.phkr.int = PHKR.INT
	phkr.int = PHKR.INT
	.serverphkr.phkr.int = SERVERPHKR.PHKR.INT
	serverphkr.phkr.int = SERVERPHKT.PHKR.INT
	.mit.edu = ATHENA.MIT.EDU
	mit.edu = ATHENA.MIT.EDU
	.media.mit.edu = MEDIA-LAB.MIT.EDU
	media.mit.edu = MEDIA-LAB.MIT.EDU
	.csail.mit.edu = CSAIL.MIT.EDU
	csail.mit.edu = CSAIL.MIT.EDU
	.whoi.edu = ATHENA.MIT.EDU
	whoi.edu = ATHENA.MIT.EDU
	.stanford.edu = stanford.edu
	.slac.stanford.edu = SLAC.STANFORD.EDU
        .toronto.edu = UTORONTO.CA
        .utoronto.ca = UTORONTO.CA

#[login]
#krb4_convert = true
#krb4_get_tickets = false

```

# Zertifikate Installieren von Win Server auf Linux

Auf Win server zertifkat erstellen

cp zert.crt /usr/share/ca-certificates/

sudo dpkg-reconfigure ca-certificates


<https://techexpert.tips/de/windows-de/aktivieren-des-active-directory-ldap-over-ssl-features/>

<https://geekdudes.wordpress.com/2020/02/18/linux-connecting-to-windows-ldap-over-ssl-ldaps-using-certificate/>

<https://stackoverflow.com/questions/642284/do-i-need-to-convert-cer-to-crt-for-apache-ssl-certificates-if-so-how>

<https://blog.wydler.eu/2014/08/02/ca-zertifikat-unter-debian-importieren/>


## Kreberos Ticket Anfordern

kini [DomainUser(Admin)]

kinit Administrator@KREUZERKEKNETWORK.DE

## TiketsAnzeigen

klist

# Keytab File

>#ktutil\
>ktutil: addent -password -p Administrator@PHKR.INT -k 5 -f\
>ktutil: wkt ph.keytab

## Tiket Holen

kinit Administrator@PHKR.INT -k -t tab2.keytab

kinit Administrator@PHKR.INT -k -t ph.keytab

# Webserver aufsetzen

## instalation
https://github.com/angristan/nginx-autoinstall

## fixes

apt install libuuid1=2.36.1-8+deb11u1

apt install libxml2=2.9.10+dfsg-6.7

apt install libssl1.1=1.1.1k-1+deb11u1
 
 ## config file

 /etc/nginx/nginx.conf
 ```
 user www-data;
worker_processes auto;
pid /run/nginx.pid;

events {
    worker_connections 2048;
    use epoll;
    multi_accept on;
}

http {
    include /etc/nginx/mime.types;
    default_type application/octet-stream;

    access_log /var/log/nginx/access.log;
    error_log /var/log/nginx/error.log;

    aio threads;
    sendfile on;
    tcp_nopush on;
    tcp_nodelay on;
    server_tokens off;

    gzip on;
    gzip_vary on;
    gzip_comp_level 6;
    gzip_proxied any;
    gzip_types *;

    include /etc/nginx/conf.d/*.conf;
    include /etc/nginx/sites-enabled/*.conf;

	server {
		listen         80 default_server;
		listen         [::]:80 default_server;
		server_name    localhost;
		root           [BasePath];
		index          index.html;
		try_files $uri /index.html;
	}
}


 ```
## Konfig datei mit php
 /etc/nginx/nginx.conf
 ```
 user www-data;
worker_processes auto;
pid /run/nginx.pid;

events {
    worker_connections 2048;
    use epoll;
    multi_accept on;
}

http {
    include /etc/nginx/mime.types;
    default_type application/octet-stream;

    access_log /var/log/nginx/access.log;
    error_log /var/log/nginx/error.log;

    aio threads;
    sendfile on;
    tcp_nopush on;
    tcp_nodelay on;
    server_tokens off;

    gzip on;
    gzip_vary on;
    gzip_comp_level 6;
    gzip_proxied any;
    gzip_types *;

    include /etc/nginx/conf.d/*.conf;
    include /etc/nginx/sites-enabled/*.conf;

	server {
		listen         80 default_server;
		listen         [::]:80 default_server;
		server_name    localhost;
		root           /home/philipp/skripte/serverPHP;
		index          index.php index.html;
		#try_files $uri /index.html;

		location / {
			try_files $uri $uri/ =404;
		}
		location ~ \.php$ {
			include fastcgi_params;
			fastcgi_intercept_errors on;
			#fastcgi_pass unix:/run/php/php7.4-fpm.sock;
			fastcgi_pass unix:/run/php/php8.1-fpm.sock;
			fastcgi_param SCRIPT_FILENAME $document_root/$fastcgi_script_name;
		}

		location ~ /\.ht {
			deny all;
		}
	}
}

 ```

 https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-in-ubuntu-16-04 

 https://stackoverflow.com/questions/43262435/nginxs-fastcgi-php-conf-snippet-is-missing
# systemd befehle

systemctl status  nginx

systemctl restart  nginx

# cert selbst erstellen

> /etc/hosts
`10.200.10.2 linux11.phkr.int`

> Länder Kürzel
`DE`

muss mit der domain addresse im server und cert identisch sein

## SSL zertifikate anlegen

> `mkdir [WAHTEVERPLACE] && cd [WAHTEVERPLACE]`
 
`mkdir /root/ca3 && cd /root/ca3`

> `openssl req -new -x509 -newkey rsa:2048 -keyout [NAMECA].pem -out [NAMECA].pem -days 3650`

`openssl req -new -x509 -newkey rsa:2048 -keyout cakey.pem -out cacert.pem -days 3650`

Passwort vergeben

Länder Kürzel angben => "DE"

eventuell Andere Daten

"Common Name" -> "Domain Name" , bcwn

>`chmod 600 [NAMECA].pem`

`chmod 600 cakey.pem`
###  CA cert erfolgreich erstellt

>`openssl genrsa -out [SERVERKEY].pem -aes128 2048 `

`openssl genrsa -out serverkey.pem -aes128 2048` 

dump passwort vergeben wird glieich wieder entfetnt

>`openssl rsa -in [SERVERKEY].pem -out [SERVERKEY].pem`

`openssl rsa -in serverkey.pem -out serverkey.pem`

passwort eingeben

## Server cert erstellt

>`openssl req -new -key [SERVERKEY].pem -out req.pem -nodes`

`openssl req -new -key serverkey.pem -out req.pem -nodes`

GENAU gleiche Daten eintragen wie Beim erstellen des CA certs

Common name MUSS DOMAIN NAME sein 

challenge passwort leer lassen

## OPEN ssl config anpassen

in '/etc/ssl/openssl.cnf'

> [CA_default]

```dir             = .              # Where everything is kept 
new_certs_dir   = $dir           # default place for new certs 
private_key     = $dir/cakey.pem # The private key 
RANDFILE        = $dir/.rand     # private random number file 
default_days    = 3650           # how long to certify for 
```

> [policy_match]
```
stateOrProvinceName     = optional
```

zu sätzliche nötige datei erzeugen

```echo 01 > serial```

```touch index.txt```

## eigenser zertifikat signieren

```openssl ca -in req.pem -notext -out servercert.pem```
 
 passwort eigeben

 und zweimal y

## Certs kopieren

cp servercert.pem /usr/local/share/ca-certificates/servercert.crt
cp serverkey.pem /etc/ssl/serverkey.pem
 
## trusten

cp cacert.pem /usr/local/share/ca-certificates/cacert.crt
sudo update-ca-certificates

# Nginx conf mit cert

``` 
user www-data;
worker_processes auto;
pid /run/nginx.pid;

events {
    worker_connections 2048;
    use epoll;
    multi_accept on;
}

http {
    include /etc/nginx/mime.types;
    default_type application/octet-stream;

    access_log /var/log/nginx/access.log;
    error_log /var/log/nginx/error.log;

    aio threads;
    sendfile on;
    tcp_nopush on;
    tcp_nodelay on;
    server_tokens off;

    gzip on;
    gzip_vary on;
    gzip_comp_level 6;
    gzip_proxied any;
    gzip_types *;

    include /etc/nginx/conf.d/*.conf;
    include /etc/nginx/sites-enabled/*.conf;
	server{
		listen 80;
		server_name linux.phkr.int;
		return 301 https://localhost$request_uri;
	}

	server {	 
		listen		443 ssl http2; 
		ssl_certificate /usr/local/share/ca-certificates/servercert.crt;
		ssl_certificate_key /etc/ssl/serverkey.pem;
		server_name    linux11.phkr.int;
		root           /home/philipp/skripte/serverPHP;
		index          index.php index.html; 

    location / {
        try_files $uri $uri/ =404;
    }
		location ~ \.php$ {
        		 include fastcgi_params;
			fastcgi_intercept_errors on;
        		fastcgi_pass unix:/run/php/php8.1-fpm.sock;
			fastcgi_param SCRIPT_FILENAME $document_root/$fastcgi_script_name;
    		}

    		location ~ /\.ht {
        		deny all;
    		}
	}
}
```
# Links

<http://www.itadmintools.com/2011/07/creating-kerberos-keytab-files.html>
<https://docs.tibco.com/pub/spotfire_server/7.8.0/doc/html/TIB_sfire_server_tsas_admin_help/GUID-27726F6E-569C-4704-8433-5CCC0232EC79.html>
<https://docs.oracle.com/cd/E24841_01/html/E23287/refer-5.html>

<https://helgeklein.com/download/>

<https://www.frankysweb.de/active-directory-passwortaenderung-mittels-webseite/>

<https://sid-500.com/2017/03/31/active-directory-zertifikatsdienste-teil-2-installation-der-zertifizierungsstellen-webregistrierung/>
<https://social.technet.microsoft.com/wiki/contents/articles/2980.ldap-over-ssl-ldaps-certificate.aspx>
<https://techexpert.tips/de/windows-de/aktivieren-des-active-directory-ldap-over-ssl-features/>

<https://geekdudes.wordpress.com/2020/02/18/linux-connecting-to-windows-ldap-over-ssl-ldaps-using-certificate/>

<https://wiki.ubuntuusers.de/GRUB_2/Konfiguration/>
