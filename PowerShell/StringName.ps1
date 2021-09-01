$_tmp = Get-ChildItem *.DSN
$_splitTmp = $_tmp -split '\\'
$_folderName = $_splitTmp[$_splitTmp.Length - 1] -split '\.'
Remove-Variable -Name _tmp, _splitTmp #Remove temporary variables
$_folderName = $_folderName[0]
if (Test-Path ".\$_folderName Schematics") {
    Write-Output "Directory already exist."
} else {
    New-Item -Name "$_folderName Schematics" -ItemType Directory
}
[string]$dest = Get-ChildItem '*Schematics'
Copy-Item *.NET -Destination $dest
