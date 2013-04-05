$Path = "# PATH"
$Group = "# GROUP NAME"
$Domain = "# DOMAIN"
$dir = "# DIRECTORY NAME"

$Find = Get-Childitem -path "$Path" -recurse -force | Where-Object{$_.PSIsContainer} | Get-ACL | Select-Object Path -ExpandProperty Access | where { $_.IdentityReference -like "$Domain\$GROUP"} | select-object path,accesscontroltype,identityreference,isinherited | ogv

# This is used to keep the windows open after the code is run.
[System.Console]::Read()

# This is just another way to use the code. Instead of displaying the results in OGV, it exports the results to a CSV.
$Find = Get-Childitem -path "$Path" -recurse -force | Where-Object {$_.PSIsContainer} | Get-ACL | Select-Object Path -ExpandProperty Access | where { $_.IdentityReference -like "$Domain\$GROUP"} | select-object path,accesscontroltype,identityreference,isinherited | export-csv "$dir"
