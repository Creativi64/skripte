#!/bin/bash

if [[ "$1" == "aus" ]]; then
    setfacl -Rm m:rwx /home/chef/geheim
else
    setfacl -Rm m:--- /home/chef/geheim #setzt rekrusiv die rechte der mask auf keine
fi