
Import-Module 'C:\tools\poshgit\dahlbyk-posh-git-9bda399\src\posh-git.psd1'

# First system config for windows 10.
function toff { shutdown /p }
Set-Alias shortcut 'toff'
function reset { shutdown /r }
Set-Alias shortcut 'reset'
function openPsAdmin { 
  Start-Process -Filepath "powershell" -Verb runas -WindowStyle Maximized 
  }
Set-Alias -name admin -value openPsAdmin
function cdMovies {
  Set-Location C:\Movies
}
Set-Alias -name movies -value cdMovies

# July 1, 2021: new commands for IMI project workflow.
# Project Navigation & Control:
function startDatasheet1 {
  Start-Process 'C:\Users\GAIA\Desktop\Design\Projects\DSSTI02 Control\Datasheet'
  }
Set-Alias -name datasheet1 -value startDatasheet1
function startDatasheet2 {
  Start-Process 'C:\Users\GAIA\Desktop\Design\Projects\DSSTI02 Sentinel\Docs\Datasheet'
  }
Set-Alias -name datasheet2 -value startDatasheet2
function startDatasheet {
  Start-Process 'C:\Users\GAIA\OneDrive - Integrated Micro-Electronics Inc\Datasheet'
  }
Set-Alias -name datasheet -value startDatasheet
function projectDirectory {
  Set-Location 'C:\Users\GAIA\Desktop\Design\Projects'
  }
Set-Alias -name prjdir -value projectDirectory
function startRef {
  Start-Process 'C:\Users\GAIA\Desktop\Design\Projects\reference'
  }
Set-Alias -name ref -value startRef
function startBom {
  Start-Process 'C:\Users\GAIA\Desktop\Design\Cadence Configuration reference\BOM processing tool.xlsm'
  }
Set-Alias -name bom -value startBom
function sniptool {
  Start-Process snippingtool
  }
Set-Alias -name snptl -value sniptool
# function openCode {$_code = start-process "C:\Users\GAIA\AppData\Local\Programs\Microsoft VS Code Insiders\Code - Insiders.exe"}
# Set-Alias -name code -value  openCode

# Replace content in {}, place new directory of the new project.
function startPrj1 {
  Start-Process 'C:\Users\GAIA\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Cadence Release 17.2-2016\OrCAD Products\Capture CIS' 'C:\Users\GAIA\Desktop\Design\Projects\DSSTI02_Control\DSSTI02_CONTROL.opj'
  }
Set-Alias -name openprj1 -value startPrj1
function startPrj2 {
  Start-Process 'C:\Users\GAIA\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Cadence Release 17.2-2016\OrCAD Products\Capture CIS' 'C:\Users\GAIA\Desktop\Design\Projects\DSSTI02_Sentinel\DSSTI02_SENTINEL.opj'
  }
Set-Alias -name openprj2 -value startPrj2
function openQbit {
  Start-Process 'C:\Program Files\qBittorrent\qbittorrent.exe'
  }
Set-Alias -name qbit -value openQbit


# Alias modification and application control: ### add a command for  to run vscode in the background and Out-Null the feedback.
function setAlias { 
  Start-Process 'C:\Users\GAIA\Documents\WindowsPowerShell\Microsoft.PowerShell_profile'
  }
Set-Alias -name setal -value setAlias
function open_Edge {
  Start-Process 'C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe'
}
Set-Alias -name openedge -value open_Edge

### office aliases.
function officeAlias {
  [string]$_officeVar = Read-Host "Which office app you want to open [word(1), excel(2) or pwrpnt(3)]?"
    if (($_officeVar -eq 'word') -or ($_officeVar -eq '1')) {
        Start-Process 'C:\Program Files (x86)\Microsoft Office\root\Office16\winword.exe' -WindowStyle Maximized
        Clear-Host
        write-Host "[executing Microsoft Word]"
      } elseif (($_officeVar -eq 'excel') -or ($_officeVar -eq '2')) {
        Start-Process 'C:\Program Files (x86)\Microsoft Office\root\Office16\excel.exe' -WindowStyle Maximized
        Clear-Host
        Write-Host "[executing Microsoft Excel]"
      } elseif (($_officeVar -eq 'pwrpnt') -or ($_officeVar -eq '3')) {
        Start-Process 'C:\Program Files (x86)\Microsoft Office\root\Office16\powerpnt.exe' -WindowStyle Maximized
        Clear-Host
        Write-Host "[executing Microsoft PowerPoint]"
    } else { Write-Host 'app not available.' -ForegroundColor Red -BackgroundColor Black }
 }
Set-Alias -name office -value officeAlias

function Get-closeProgram {

    param ( 
        $_openQbit,
        $_setAlias,
        $_open_Edge,
        $_openWinWord,
        $_openExcel,
        $_openPowerPnt,
        $_staPrj1,
        $_staPrj2,
        $_sniptool,
        $_staBomTool,
        $_staReference,
        $_prjdirectory,
        $_staDatasheet,
        $_staDatasheet1,
        $_staDatasheet2,
        $_staMovies,
        $_staMsTeams
    )

    $_openQbit = Get-Process -Name "qbittorrent" -ErrorAction SilentlyContinue
    $_setAlias = Get-Process -Name "Code - Insiders" -ErrorAction SilentlyContinue
    $_open_Edge = Get-Process -Name "Msedge" -ErrorAction SilentlyContinue
    $_openWinWord = Get-Process -Name "WINWORD" -ErrorAction SilentlyContinue
    $_openExcel = Get-Process -Name "EXCEL" -ErrorAction SilentlyContinue
    $_openPowerPnt = Get-Process -Name "POWERPNT" -ErrorAction SilentlyContinue
    $_staPrj1 = Get-Process -Name "Capture" -ErrorAction SilentlyContinue
    $_staPrj2 = Get-Process -Name "Capture" -ErrorAction SilentlyContinue
    $_sniptool = Get-Process -Name "SnippingTool" -ErrorAction SilentlyContinue
    $_staBomTool = Get-Process -Name "EXCEL" -ErrorAction SilentlyContinue
    $_staReference = Get-Process -Name "explorer" -ErrorAction SilentlyContinue
    $_prjdirectory = Get-Process -Name "explorer" -ErrorAction SilentlyContinue
    $_staDatasheet = Get-Process -Name "explorer" -ErrorAction SilentlyContinue
    $_staDatasheet1 = Get-Process -Name "explorer" -ErrorAction SilentlyContinue
    $_staDatasheet2 = Get-Process -Name "explorer" -ErrorAction SilentlyContinue
    $_staMovies = Get-Process -Name "explorer" -ErrorAction SilentlyContinue
    $_staMsTeams = Get-Process -Name "teams" -ErrorAction SilentlyContinue

    if ($_openQbit.HasExited -eq $false) {
        Stop-Process -InputObject $_openQbit
    } 
    if ($_setAlias.HasExited -eq $false) {
        Stop-Process -InputObject $_setAlias
    } 
    if ($_open_Edge.HasExited -eq $false) {
        Stop-Process -InputObject $_open_Edge
    } 
    if ($_openWinWord.HasExited -eq $false) {
        Stop-Process -InputObject $_openWinWord
    } 
    if ($_openExcel.HasExited -eq $false || $_staBomTool.HasExited -eq $false) {
        Stop-Process -Name "EXCEL"
    } 
    if ($_openPowerPnt.HasExited -eq $false) {
        Stop-Process -InputObject $_openPowerPnt
    } 
    if ($_staReference.HasExited -eq $false || $_staDatasheet.HasExited -eq $false || $_staDatasheet1.HasExited -eq $false || $_staDatasheet2.HasExited -eq $false || $_staMovies.HasExited -eq $false) {
       Stop-Process -Name "explorer"
    }
    if ($_staMsTeams.HasExited -eq $false) {
        Stop-Process -InputObject $_staMsTeams
    } 
}

Set-Alias -Name closeall -value Get-closeProgram

# function _closeProgram {
#   $_openQbit = Get-Process -Name "qbittorrent" -ErrorAction SilentlyContinue
#   $_setAlias = Get-Process -Name "Code - Insiders" -ErrorAction SilentlyContinue
#   $_open_Edge = Get-Process -Name "Msedge" -ErrorAction SilentlyContinue
#   $_openWinWord = Get-Process -Name "WINWORD" -ErrorAction SilentlyContinue
#   $_openExcel = Get-Process -Name "EXCEL" -ErrorAction SilentlyContinue
#   $_openPowerPnt = Get-Process -Name "POWERPNT" -ErrorAction SilentlyCntinue,
#   $_staPrj1 = Get-Process -Name "Capture" -ErrorAction SilentlyContinue
#   $_staPrj2 = Get-Process -Name "Capture" -ErrorAction SilentlyContinue
#   $_sniptool = Get-Process -Name "SnippingTool" -ErrorAction SilentlyCotinue,
#   $_staBomTool = Get-Process -Name "EXCEL" -ErrorAction SilentlyContinue
#   $_staReference = Get-Process -Name "explorer" -ErrorAction SilentlyContinue
#   $_prjdirectory = Get-Process -Name "explorer" -ErrorAction SilentlyContinu,
#   $_staDatasheet = Get-Process -Name "explorer" -ErrorAction SilentlyContinue
#   $_staDatasheet1 = Get-Process -Name "explorer" -ErrorAction SilentlyContinue
#   $_staDatasheet2 = Get-Process -Name "explorer" -ErrorAction SilentlyContnue,
#   $_staMovies = Get-Process -Name "explorer" -ErrorAction SilentlyContinue,
#   if ($_openQbit.HasExited -eq $alse) {
#    Stop-Process -Name $_openQbit
#   



#     # Get-Process -Name "Capture" -ErrorAction SilentlyContinue | Stop-Proces,
#     # Get-Process -Name "winword" -ErrorAction SilentlyContinue | Stop-Process
#     # Get-Process -Name "teams" -ErrorAction SilentlyContinue | Stop-Process
#     # Get-Process -Name "excel" -ErrorAction SilentlyContinue | Stop-Process
#     # Get-Process -Name "explorer" -ErrorAction SilentlyContinue | Stop-Process
#     # Get-Process -Name "powerpnt" -ErrorAction SilentlyContinue | Stop-Process
#     # Get-Process -Name "foxitpdfreader" -ErrorAction SilentlyContinue | Sto-Process,
#     # Get-Process -Name "msedge" -ErrorAction SilentlyContinue | Stop-Process
#     # Get-Process -Name "systemsettings" -ErrorAction SilentlyContinue | Stop-Process
# }
# Set-Alias -Name closeall -value _closeProgram

# This command will restart the wsl.
# Get-Service LxssManager | Restart-Service


# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

<# Load SSH agent utils
 Reference: https://dillieodigital.wordpress.com/2015/10/20/how-to-git-and-ssh-in-powershell/
            https://vladtalkstech.com/2014/03/change-pwershell-machinepolicy-execution-policy-windows-server-2012r2.html           ,
            https://www.youtube.com/watch?v=n2-wZDux8L4
#>

. 'C:\tools\poshgit\dahlbyk-posh-git-9bda399\install.ps1'