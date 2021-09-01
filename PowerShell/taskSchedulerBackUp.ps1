$action = New-ScheduledTaskAction 'powershell.exe' -Argument 'C:\Users\GAIA\Documents\PowerShell\scripts\PowerShell\backUp\backUp.ps1'
$startTime = (Get-Date).AddMinutes(1).ToString("HH:mm:ss")
$taskSetting = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -RestartCount 3 -RestartInterval (New-TimeSpan -Minutes 30)
$Params = @{
    "Once" = $true
    "At" = $startTime
    "RepetitionInterval" = (New-TimeSpan -Hours 3)
}
$trigger = New-ScheduledTaskTrigger @Params

Register-ScheduledTask -Action $action -Trigger $trigger -TaskName 'BTBackUp' -Description "Automatically back up the design folder to cloud based folder every 3 hours." -User "GAIA" -Setting $taskSetting