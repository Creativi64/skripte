#! /bin/bash 
if  [  -f  “$1“  ]
then 
   if  [  -w  “$1“ ]
   then
       iconv -f ISO-8859-15  -t UTF-8  “$1“  >  “/tmp/${1}$$“ 
       mv   “${1}$$“   “$1“
   else
       echo “Es fehlen die Schreibrechte auf ${1}!“
   fi 
else
   echo “Der Übergabeparameter fehlt oder ist keine Datei!“
fi
