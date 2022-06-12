# Regex

kann einfach üver die VScode Suche gesetet werden das erste von rechts erlaubt regex nutzung

## Nützliche seiten

<https://regexr.com/>

<https://regex101.com/>

<https://www.debuggex.com/> Visiualizer

`[]` Character Set z.b. alle zahlen von 0 bis 9 `[0-9]` negiert `[^0-9]`

`{}` Anzahl der erlaubten des vorhergegangenen z.b `[0]{1}` es muss genau eine null sein, `[0-9]{1,2}` es können ein bis zweimal die Zahlen 0 bis 9 vorkommen `[0-9][1,]` min 1 mal

`*` Mehr

`+` einer oder mehr

`?` Einer oder keine

`.` Jeder Charakter

`\w` `\d` `\s` Wort, Zahl, Lerrzeichen
`\W` `\D` `\S` Kein Wort, Zahl, Lerrzeichen

`^` Anfang der Zeile

`$` Ende der Zeile

`a|b` Match a oder b

`+?` so wenig wie Möglisch Matchen

`()` group

## beispiel Basic email regex

`(\w{3,})@(\w{1,5}).(\w{2,4})`

kew@gmail.com

1 .
2 .
3 .
zu
1.
2.
3.

`(\d) (.)`
`$1$2`

<https://stackoverflow.com/questions/34618383/vscode-regex-find-replace-submatch-math>