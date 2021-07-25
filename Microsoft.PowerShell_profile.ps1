
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

function Open-Application {

  [CmdletBinding(SupportsShouldProcess)]
  param (
    [string]$Name
  )

  process {
    if ($Name -eq "edge") {
      Start-Process 'C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe'
    } elseif ($Name -eq "qbit") {
      Start-Process 'C:\Program Files\qBittorrent\qbittorrent.exe'
    } elseif ($Name -eq "setal") {
      Start-Process 'C:\Users\GAIA\Documents\PowerShell\Microsoft.PowerShell_profile'
    } elseif ($Name -eq "prj1") {
      Start-Process 'C:\Users\GAIA\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Cadence Release 17.2-2016\OrCAD Products\Capture CIS' 'C:\Users\GAIA\Desktop\Design\Projects\DSSTI02_Control\DSSTI02_CONTROL.opj'
    } elseif ($Name -eq "prj2") {
      Start-Process 'C:\Users\GAIA\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Cadence Release 17.2-2016\OrCAD Products\Capture CIS' 'C:\Users\GAIA\Desktop\Design\Projects\DSSTI02_Sentinel\DSSTI02_SENTINEL.opj'
    } elseif ($Name -eq "snptl") {
      Start-Process "snippingtool"
    } elseif ($Name -eq "bom") {
      Start-Process 'C:\Users\GAIA\Desktop\Design\Cadence Configuration reference\BOM processing tool.xlsm'
    } elseif ($Name -eq "word") {
      Start-Process 'C:\Program Files (x86)\Microsoft Office\root\Office16\winword.exe' -WindowStyle Maximized
      Clear-Host
      write-Host "[executing Microsoft Word]" -ForegroundColor Green
    } elseif ($Name -eq "excel") {
      Start-Process 'C:\Program Files (x86)\Microsoft Office\root\Office16\excel.exe' -WindowStyle Maximized
      Clear-Host
      write-Host "[executing Microsoft Excel]" -ForegroundColor Green
    } elseif ($Name -eq "powerpnt") {
      Start-Process 'C:\Program Files (x86)\Microsoft Office\root\Office16\powerpnt.exe' -WindowStyle Maximized
      Clear-Host
      Write-Host "[executing Microsoft PowerPoint]" -ForegroundColor Green
    } elseif ($Name -eq "datasheet") {
      Start-Process 'C:\Users\GAIA\OneDrive - Integrated Micro-Electronics Inc\Datasheet'
    } elseif ($Name -eq "prjdir") {
      Start-Process 'C:\Users\GAIA\Desktop\Design\Projects'
    } elseif ($Name -eq "ref") {
      Start-Process 'C:\Users\GAIA\Desktop\Design\Projects\reference'
    } else {
      Write-Host "[$Name not found.]" -ForegroundColor Red
    }
  }
}
Set-Alias -name open -value Open-Application

function Close-Application {

  [CmdletBinding(SupportsShouldProcess)]
  param ( 
    [string]$ApplicationName
  )

  process {
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
    Write-Host "[closing $ApplicationName]" -ForegroundColor Red

    if (($_openQbit.HasExited -eq $false) -and ($ApplicationName -eq "qbit")) {
      Stop-Process -Name "qbittorrent"
    } elseif (($_setAlias.HasExited -eq $false) -and ($ApplicationName -eq "code")) {
      Stop-Process -Name "Code - Insiders"
    } elseif (($_open_Edge.HasExited -eq $false) -and ($ApplicationName -eq "edge")) {
      Stop-Process -InputObject $_open_Edge
    } elseif (($_openWinWord.HasExited -eq $false) -and ($ApplicationName -eq "word")) {
      Stop-Process -InputObject $_openWinWord
    } elseif (($_sniptool.HasExited -eq $false) -and ($ApplicationName -eq "edge")) {
      Stop-Process -Name "snippingtool"
    } elseif ((($_openExcel.HasExited -eq $false) -or ($_staBomTool.HasExited -eq $false)) -and ($ApplicationName -eq "excel")) {
      Stop-Process -Name "EXCEL"
    } elseif (($_openPowerPnt.HasExited -eq $false) -and ($ApplicationName -eq "powerpnt")) {
      Stop-Process -InputObject $_openPowerPnt
    } elseif ((($_staPrj1.HasExited -eq $false) -or ($_staPrj2.HasExited -eq $false)) -and ($ApplicationName -eq "Capture")) {
      Stop-Process -Name "Capture"
    } elseif ((($_staReference.HasExited -eq $false) -or ($_staDatasheet.HasExited -eq $false) -or ($_staDatasheet1.HasExited -eq $false) -or ($_staDatasheet2.HasExited -eq $false) -or ($_staMovies.HasExited -eq $false) -or ($_prjdirectory.HasExited -eq $false)) -and ($ApplicationName -eq "explorer")) {
      Stop-Process -Name "explorer"
    } elseif (($_staMsTeams.HasExited -eq $false) -and ($ApplicationName -eq "teams")) {
      Stop-Process -InputObject $_staMsTeams
    } elseif ($ApplicationName -eq "all") {
      Stop-Process -Name "Capture" -ErrorAction SilentlyContinue
      Stop-Process -Name "Code - Insiders" -ErrorAction SilentlyContinue
      Stop-Process -Name "qbittorrent" -ErrorAction SilentlyContinue
      Stop-Process -Name "winword" -ErrorAction SilentlyContinue
      Stop-Process -Name "EXCEL" -ErrorAction SilentlyContinue
      Stop-Process -Name "powerpnt" -ErrorAction SilentlyContinue
      Stop-Process -Name "snippingtool" -ErrorAction SilentlyContinue
      Stop-Process -Name "msedge" -ErrorAction SilentlyContinue
      Stop-Process -Name "explorer" -ErrorAction SilentlyContinue
      Stop-Process -Name "Teams" -ErrorAction SilentlyContinue
    } else {
      Write-Output "Application not found."
    }
  }
}
Set-Alias -Name close -value Close-Application

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