param([Parameter(Mandatory=$true)][String]$samAccountName)


$fullPath = "\\SERVERPHKR\Homes\{0}" -f $samAccountName
$driveLetter = "H:"
 
$User = Get-ADUser -Identity $samAccountName
 
if($User -ne $Null) {
 
    if((Test-Path -Path $fullPath) -ne $true ){
        
        New-Item -Path $fullPath -ItemType Directory  
    

         Set-ADUser $User -HomeDrive $driveLetter -HomeDirectory $fullPath -ea Stop
    
        Disable-NTFSAccessInheritance -Path $fullPath -RemoveInheritedAccessRules
        Clear-NTFSAccess -Path $fullPath
      Add-NTFSAccess $fullPath -Account "Administrator" -AccessRights FullControl  
      Add-NTFSAccess $fullPath -Account  $User.SamAccountName -AccessRights Modify
    
    
        Write-Host ("HomeDirectory created at {0}" -f $fullPath)
    }
}

#param([Parameter(Mandatory=$true)][String]$samAccountName)
#
#
#$fullPath = "\\SERVERPHKR\Homes\{0}" -f $samAccountName
#$driveLetter = "H:"
# 
#$User = Get-ADUser -Identity $samAccountName
# 
#if($User -ne $Null) {
#    Set-ADUser $User -HomeDrive $driveLetter -HomeDirectory $fullPath -ea Stop
#    $homeShare = New-Item -path $fullPath -ItemType Directory -force -ea Stop
# 
#    $acl = Get-Acl $homeShare
#    
#    $acl
#
#    $FileSystemRights = [System.Security.AccessControl.FileSystemRights]"FullControl"
#    $AccessControlType = [System.Security.AccessControl.AccessControlType]::Allow
#    $InheritanceFlags = [System.Security.AccessControl.InheritanceFlags]"ContainerInherit, ObjectInherit"
#    $PropagationFlags = [System.Security.AccessControl.PropagationFlags]"InheritOnly"
# 
#    $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule ($User.SID, $FileSystemRights,<# $InheritanceFlags, $PropagationFlags,#> $AccessControlType)
#    $acl.AddAccessRule($AccessRule)
# 
#    Set-Acl -Path $homeShare -AclObject $acl -ea Stop
# 
#    Write-Host ("HomeDirectory created at {0}" -f $fullPath)
#}