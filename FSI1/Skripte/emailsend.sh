#!/bin/bash

echo -e "betreff der Email: \c"
read -r Subject
#SUBJECT="Betreffzeile"
echo -e "Sene Email an E-Mail Adresse: \c"
read -r Emailaddr
##EMAIL ="[email]"

echo "nachricht"
echo "beginn der anchricht" > ./tmp/emailmessage.txt
echo "Ende mit \"###\""
nachricht=""
echo -e "Ihre nachricht: \c"

while [ \( "$nachricht" != "####" \) ]
do 
    read -r nachricht
    echo "$nachricht" >> ./tmp/emailmessage.txt
done 

echo "Email Ende" >> ./tmp/emailmessage.txt
# Send an Email using /bit/mail
cat ./tmp/emailmessage.txt | mail -r "kpk@aquarus.net" -s "$Subject" "$Emailaddr"

exit 1