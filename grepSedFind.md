# Befehle

## Grep

sucht und gibt Zeilen zurück die patten entsprechen oder beinhalten

`cat text.txt | grep Test`

oder mir regex

`egrep`

`cat text.txt | grep -E "[A-Z]est"`

Jedes test egal ob groß oder klein Geschieben und mit kein er Nummer bis zum Zeilen ende

`cat  text.txt | grep -E "[A-Z,a-z]est[^0-9]{0,}$"`

## Sed

Suchen und ersetzen

`sed s/[Regex]/[Replacement]/`

`cat text.txt | sed s/es/ES/ >text2.txt`

`sed s/es/ES/ text.txt >text2.txt`

gibt nur die geänderten zeilen aus ohne die datei direkt zu verändern

`sed s/es/ES/ text.txt`

<https://linuxconfig.org/learning-linux-commands-sed>

## Find

Kann nach dateine suchen

`find /[Path] -name [DateiName] (-type {f File | d Directory | s socked | p pipe})`

`find ./ -name "*\.[cC][sS][vV]"`
