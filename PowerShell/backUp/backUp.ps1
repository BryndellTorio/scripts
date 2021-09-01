$cloudFolder = 'C:\Users\GAIA\OneDrive - Integrated Micro-Electronics Inc\Design\'
$projectFolder = 'C:\Users\GAIA\Documents\Design\Projects'
# Used in testing the script, $testFolder = 'C:\Users\GAIA\Documents\Design\Projects\testFolder'

$getDate = Get-Date -Format "dddd MM/dd/yyyy HH:mm:ss"
$backUpTestPath = Test-Path $HOME\Documents\PowerShell\scripts\PowerShell\backUp\backUp.log

if ($backUpTestPath -eq $true) {
    Add-Content $HOME\Documents\PowerShell\scripts\PowerShell\backUp\backUp.log -Value "USER: $HOME Time: $getDate Activity: BackUp Done"
}
elseif ($backUpTestPath -eq $false) {
    New-Item -Path $HOME\Documents\PowerShell\scripts\PowerShell\backUp\backUp.log -ItemType file -Value "USER: $HOME Time: $getDate Activity: Log file created, Back up done.`n" 
}
Write-Output "Executing design folder back up..."
Copy-Item $projectFolder -Destination $cloudFolder -Force -Recurse -ErrorAction Ignore
# Write-Output "Folder back up done."