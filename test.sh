#!/bin/bash
declare -A STAT
# Max. Laenge eines Histogrammbalkens
HMAX=40
# Noten einlesen
COUNT=0
while read NOTE; do
STAT[$NOTE]=$(( ${STAT[$NOTE]} + 1 ))
COUNT=$(( $COUNT + 1 ))
done < noten
# Ausgabe: Note, Anzahl (unsortiert)
for I in "${!STAT[@]}"; do
echo "$I ${STAT[$I]}"
done
# Gesamtanzahl ausgeben
echo $COUNT
# Maximalwert der Anzahlen bestimmen
MAX=0
for I in "${!STAT[@]}"; do
if [ ${STAT[$I]} -gt $MAX ]; then
MAX=${STAT[$I]}
fi
done
# Histogramm ausgeben (sortiert)
echo ""
for I in "${!STAT[@]}"; do
echo -n "$I (${STAT[$I]}): "
LEN=$(( ${STAT[$I]} * $HMAX / $MAX ))
for K in $(seq 1 $LEN); do
echo -n "#"
done
echo ""
done | sort

for((i=0;i<n;i++)); do
    echo "${i}"
done

dec