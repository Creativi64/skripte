#!/bin/bash
echo $(date +%s)
inms=$(echo $(date +%s))
echo $(date +%s%N)
echo $(date +%s%N)|cut -b1-13
dat=$(echo $(date +%s%N)|cut -b1-13)

echo "$dat"

aktJ=$(date +%Y)
echo "$aktJ"

WIN=$(("$aktJ"-"1601"))
LINUX=$(("$aktJ"-"1970"))
echo "+++"
j=$(( "1970" - "1601"  ))
echo "$j"
echo "+++++++"
echo "$WIN"
echo "$LINUX"

days=$(( "$j" * "360"))
hours=$(( "$days" * "24"))
dsecs=$(( "$hours" * "60"))
mills=$(( "$dsecs" * "1000"))
echo "###"
echo $mills
echo "###"
echo $(("inms"*"1000"))
normals=$(("inms"*"1000"))
echo "---"
echo $(("$normals"-"$mills"))
echo "---"
echo $(( $(echo $(date +%s%N)|cut -b1-13) / 86400 + 25569 ))