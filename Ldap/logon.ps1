#dsquery group -name "[Name]"

#dsget (dsquery user -name "Müller")
$Gruppe = dsquery group -name "L_Einkauf";
$Mitgliedschaften  = dsget user (dsquery user -name $env:USERNAME) -memberof -expand;

if ($Mitgliedschaften -contains $Gruppe) {
    echo "TTrue"
    $n = Read-Host
}else {
    echo "False"
    $n = Read-Host
}

net user %username% /domain | find /i