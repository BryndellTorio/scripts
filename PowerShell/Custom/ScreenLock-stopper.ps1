Clear-Host
Echo "...Lock screen avoider..."

$WShell = New-Object -com "Wscript.Shell"
$sleep = 30


while ($true) {
    $WShell.sendkeys("{SCROLLLOCK}")
    Start-Sleep -Milliseconds 100
    Write-Host "Press Scroll lock"
    $WShell.sendkeys("{SCROLLLOCK}")
    Write-Host "Waiting " $sleep " seconds" 
    Start-Sleep -Seconds $sleep
}
