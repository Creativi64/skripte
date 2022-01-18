#!/bin/bash
echo "Userkennung eingeben"
read -r Benutzer
echo "passwort eingeben"
read -r Passwort

expectSkript "$Benutzer" "$Passwort"