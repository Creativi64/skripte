#!/bin/bash
## Konsolen-Taschenrechner
if [ $# == 0 ]; then
    echo "Sie haben $0 ohne die zusätzlich benötigte Rechenaufgabe gestartet!"
    exit 1
fi
# Option -l für die mathematische Bibliothek

# Oder
# bc -l <<CALC
# $*
# quit
# CALC

bc -l <<CALC
$@
CALC