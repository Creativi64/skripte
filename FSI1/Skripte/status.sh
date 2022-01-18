#!/bin/bash
#status report

datum="$(date)"

datum2=`date`

rechner="$(hostname)"

os="$(uname -s)"

ip_addr="$(grep "$rechner" /etc/host | awk '{print $1}')"
echo "$datum2"
echo "Statusbericht  $datum"
echo "Rechner: $rechner  OS: $os  IP: $ip_addr"

echo "======================================"