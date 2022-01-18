#!/usr/bin/expect -f
set Ben [lindex $argv 0];
set Pass [lindex $argv 1];
spawn rsync -e „ssh -p 22“ $cannabis@192.168.179.32 
expect "Password: "
send "$Pass\r"