### Used to remove .git folders located in OneDrive.


$iniLoc = Get-Location

if (Test-Path $iniLoc\.git\) {
    $gitLoc = "$iniLoc\.git\"
    Get-ChildItem $gitLoc\* -Include * -Recurse | ForEach-Object {$_.Delete()}
    Get-ChildItem $gitLoc\* -Recurse | ForEach-Object {$_.Delete()}
    $gitDIR = Get-Item -LiteralPath $gitLoc -Force
    $gitDIR.Delete($true)
} else {
    Write-Host "Not a git folder. maybe location error."
}