#!/bin/bash

#PRÜFUNG
if  test "$#" != "5"
then
   echo -e '\a'
   BENUTZER=$(dialog --inputbox "Geben Sie den neuen Benutzernamen  ein:"   10 50 3>&1 1>&2 2>&3)
   PFAD=$(dialog --inputbox "Geben Sie das User-Homeverzeichnis ein:"       10 50 3>&1 1>&2 2>&3)
   PRIMAERGRUPPE=$(dialog --inputbox "Geben Sie die Primärgruppe ein:"      10 50 "test" 3>&1 1>&2 2>&3)
   GRUPPEN=$(dialog --inputbox "Geben Sie weitere Gruppen mit ',' ein:"     10 50 3>&1 1>&2 2>&3)
   SHELLL=$(dialog --inputbox "Geben Sie die Shell z.B. /bin/bash an:    " 10 50 "/bin/bash" 3>&1 1>&2 2>&3)
   PASSWORD=$(dialog --inputbox "Geben Sie ihr Passwort ein:    " 10 50 "123" 3>&1 1>&2 2>&3)

   PASSWORD=$(echo "$PASSWORD" |openssl passwd -1 stdin)

   set "$PFAD" "$PRIMAERGRUPPE" "$SHELLL" "$GRUPPEN" "$PASSWORD" "$BENUTZER"
   clear
fi

echo "-----------------" 
echo "useradd -m $1 -g $2 -s $3 -G $4 -p $5 -k /etc/skel $6"
echo "--------------------"
echo "Benutzer jetzt anlegen j/n ?"
read -r ANTWORT


case $ANTWORT in
   j | J )  echo "ersteleUser" && useradd -m -g "$2" -s "$3" -G "$4" -p "$5" -k "/etc/skel" "$6" && setfacl -Rdm "u:$6:rwx" "/home/$6";;
   n | N )    echo "Der User wurde NICHT angelegt !";;
   *     )    echo falsche Eingabe;;
esac

