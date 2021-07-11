# First system config for windows 10.
function prj { cd C:\Users\GAIA\Desktop\Design\Projects\DSSTI02 }
Set-Alias shortcut 'prj'
function hm { cd C:\Users\GAIA }
Set-Alias shortcut 'hm'
function toff { shutdown /p }
Set-Alias shortcut 'toff'
function reset { shutdown /r }
Set-Alias shortcut 'reset'

# July 1, 2021: new commands for IMI project workflow.
# Project Navigation & Control:
function startDatasheet1 {$_staDatasheet1 = start 'C:\Users\GAIA\Desktop\Design\Projects\DSSTI02 Control\Datasheet'}
Set-Alias -name datasheet1 -value startDatasheet1
function startDatasheet2 {$_staDatasheet2 = start 'C:\Users\GAIA\Desktop\Design\Projects\DSSTI02 Sentinel\Docs\Datasheet'}
Set-Alias -name datasheet2 -value startDatasheet2
function startDatasheet {$_staDatasheet = start 'C:\Users\GAIA\OneDrive - Integrated Micro-Electronics Inc\Datasheet'}
Set-Alias -name datasheet -value startDatasheet
function projectDirectory {$_prjdirectory = start 'C:\Users\GAIA\Desktop\Design\Projects'}
Set-Alias -name prjdir -value projectDirectory
function startRef {$_staReference = start 'C:\Users\GAIA\Desktop\Design\Projects\reference'}
Set-Alias -name ref -value startRef
function startBom {$_staBomTool = start 'C:\Users\GAIA\Desktop\Design\Cadence Configuration reference\BOM processing tool.xlsm'}
Set-Alias -name bom -value startBom

# Replace content in {}, place new directory of the new project.
function startPrj1 {$staPrj1 = start 'C:\Users\GAIA\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Cadence Release 17.2-2016\OrCAD Products\Capture CIS' C:\Users\GAIA\Desktop\Design\Projects\DSSTI02_Control\DSSTI02_CONTROL.opj}
Set-Alias -name openprj1 -value startPrj1
function startPrj2 {$staPrj2 = start 'C:\Users\GAIA\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Cadence Release 17.2-2016\OrCAD Products\Capture CIS' C:\Users\GAIA\Desktop\Design\Projects\DSSTI02_Sentinel\DSSTI02_SENTINEL.opj}
Set-Alias -name openprj2 -value startPrj2


# Alias modification and application control: ### add a command for setal to run vscode in the background and Out-Null the feedback.
function setAlias {$setAlias = start-process 'C:\Users\GAIA\Documents\WindowsPowerShell\Microsoft.PowerShell_profile'}
Set-Alias -name setal -value setAlias
function cdSetAlias {$cdSetAlias = cd C:\Users\GAIA\Documents\WindowsPowerShell\}
Set-Alias -name cdsetal -value cdSetAlias
function open_Edge {$open_Edge = start 'C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe'}
Set-Alias -name openedge -value open_Edge

### office aliases.
function officeAlias {
  $_officeVar = Read-Host "Which office app you want to open [word, excel or pwrpnt]?"
    if ([string]$_officeVar -eq 'word') {
        start 'C:\Program Files (x86)\Microsoft Office\root\Office16\winword.exe'
        clear
        write-Host "[executing Microsoft $_officeVar]"
      } elseif ([string]$_officeVar -eq 'excel') {
        start 'C:\Program Files (x86)\Microsoft Office\root\Office16\excel.exe'
        clear
        write-Host "[executing Microsoft $_officeVar]"
      } elseif ([string]$_officeVar -eq 'pwrpnt') {
        start 'C:\Program Files (x86)\Microsoft Office\root\Office16\powerpnt.exe'
        clear
        write-Host "[executing Microsoft powerpoint]"
    } else { write-Host 'app not available.' }
 }
  Set-Alias -name office -value officeAlias

# This command will restart the wsl.
# Get-Service LxssManager | Restart-Service


# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

<# Load SSH agent utils
 Reference: https://dillieodigital.wordpress.com/2015/10/20/how-to-git-and-ssh-in-powershell/
            https://vladtalkstech.com/2014/03/change-powershell-machinepolicy-execution-policy-windows-server-2012r2.html           
            https://www.youtube.com/watch?v=n2-wZDux8L4
#>

. 'C:\tools\poshgit\dahlbyk-posh-git-9bda399\install.ps1'
