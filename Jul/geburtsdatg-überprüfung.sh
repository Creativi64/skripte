#!/bin/bash
if    egrep `date +%d/%m/`    ./geburtstagsliste.txt   >   /tmp/hallo$$.txt
then
    set  `cat /tmp/hallo$$.txt`
Datum=“$1“
shift
Namenszug=“$@“
    IFSBACK=“$IFS“
    IFS=“/“
    set   $Datum
    IFS=“$IFSBACK“
    Jahr=`date “+%Y“`
((i=${Jahr}-$3))
    echo -e “${Namenszug} hat heute Geburtstag! - Sie oder Er wird heute \c“
    echo “ $i Jahre alt!“
fi
