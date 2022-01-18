#!/bin/bash


# IMPUT=$($DIALOG --stdout --title "Eigabe" --imputbox)




echo "echo \"$IMPUT - `date`\" > /tmp/DieEingabe$$.txt" | at now +1min

exec 3>&1;
result=$(dialog --inputbox test 0 0  2>&1 1>&3);
exitcode=$?;
exec 3>&-;
echo $result $exitcode;