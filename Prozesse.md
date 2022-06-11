# asd

Kapitel 8

## Im intergrund starten

Befehn mit `&`

# jobs abfragen

`jobs`

## in den Hintergrund verschieben

`bg %[jobnr]`

## Aus dem hintergund holen

`fg %[jobnr]`

## Kill

`KILL %[jobnr]`

`KILL -s [SignalNr] [Prozessnr]`

## trap

fängt singnale ab die an den prozess gesendet werden

`trap [Metode Die ausgeführt werden soll] [signalnr die gefangen werden soll]`

## Interrupt Timer

ein timer läuft als hintewrgrund prozess ab und beendet dann dem prozess

`  sleep [Sekunden] && kill -s [SIgnal Nr] $$ &`

```bash
#!/bin/bash
TIMER_INTERRUPT=14
TIMELIMIT=5 # entspricht 5 Sekunden!

function PrintAnswer() {
    if [ "$answer" == "TIMEOUT" ]; then
        echo $answer
    else
        echo "Dein(e) Liblings-Interpret(in) heißt: $answer"
        kill $! # kill last background-job by process-id.
    fi
}

function TimerOn() {
    
    sleep $TIMELIMIT && kill -s 14 $$ & # Es wird geschlafen und danach wird der prozess mit dem signal 14 mit der Eigene prozessnummer gekillt und das ganze durch & im intergrund
}

function Int14Vector() {
    answer="TIMEOUT"
    PrintAnswer
    exit $TIMER_INTERRUPT
} 

# main
 
trap Int14Vector $TIMER_INTERRUPT #Fängt TIMER_INTERRUPT also 14 ein und macht dann int14Vector
echo "Wie heißt Dein(e) Lieblingssänger(in)?"
TimerOn
read answer
PrintAnswer
exit 0
```
