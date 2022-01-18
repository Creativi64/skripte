#!/bin/bash
datum=$(date +%d-%m-%y--%H:%M:%S)
dialog --form "Bitte geben Sie die Werte eine!"    14 80 8 \
"Quellpfad:" 1 1 "./"        1 12 80 100 \
"ZUser:"     3 1 "cannabis"                       3 12 80 28 \
"Ziel-IP:"   5 1 "192.168.179.32"               5 12 80 16 \
"Ziel-Pfad:" 7 1 "$datum""_Backup"    7 12 80 100 2> \
/tmp/hhh$$
Quelle="$(head -n 1 /tmp/hhh$$)"
ZUser="$(head -n 2 /tmp/hhh$$ | tail -n 1)"
Ziel="$(head -n 3 /tmp/hhh$$ | tail -n 1)"
Zpfad="$(tail -n 1 /tmp/hhh$$)"

rm /tmp/hhh$$

echo "rsync -avp -e 'sshpass -p 123 ssh' $Quelle $ZUser@$Ziel:$Zpfad"
echo "----------"
rsync  -av --progress -h --stats -e 'sshpass -p "123" ssh' "$Quelle" "$ZUser@$Ziel"":""$Zpfad"
# Lösung: https://www.tecmint.com/sshpass-non-interactive-ssh-login-shellscript-ssh-password/

# https://wiki.ubuntuusers.de/rsync/
# -a kopiert einfach alles
# -v zeigt alles schritte an
# -e wählt externe konsole bzw. externer befehlsinterbrter -> -e ssh
# -n simulation
# unison für platfom übergreifende backup
