#!/bin/bash

Name="Test"

./winexe -U "Administrator" //10.200.10.1 "powershell c\; c:\Homes\benutzerhome.ps1 $Name"
#./winexe -U "Administrator" //10.200.10.1 "powershell c\; c:\Homes\benutzerhome.ps1 Test"