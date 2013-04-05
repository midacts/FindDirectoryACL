$Path = "# PATH"
$Group = "# GROUP NAME"
$Domain = "# DOMAIN"
$dir = "# DIRECTORY NAME"

$Find = Get-Childitem -path "$Path" -recurse -force | Where-Object{$_.PSIsContainer} | Get-ACL | Select-Object Path -ExpandProperty Access | where { $_.IdentityReference -like "$Domain\$GROUP"} | select-object path,accesscontroltype,identityreference,isinherited | ogv

[System.Console]::Read()

$Find = Get-Childitem -path "$Path" -recurse -force | Where-Object {$_.PSIsContainer} | Get-ACL | Select-Object Path -ExpandProperty Access | where { $_.IdentityReference -like "$Domain\$GROUP"} | select-object path,accesscontroltype,identityreference,isinherited | export-csv "$dir"