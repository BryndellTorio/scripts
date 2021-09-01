#Import-Module 'C:\tools\poshgit\dahlbyk-posh-git-9bda399\src\posh-git.psd1'
Add-PoshGitToProfile

#variable defined for quick folder switch.
$prjDir = "$HOME\OneDrive - Integrated Micro-Electronics Inc\Design\Projects\"
$prof = "$HOME\Documents\PowerShell\"
$dirPrj1 = "$HOME\OneDrive - Integrated Micro-Electronics Inc\Design\Projects\DSSTI02_Control\DSSTI02_CONTROL.opj"
$dirPrj2 = "$HOME\OneDrive - Integrated Micro-Electronics Inc\Design\Projects\DSSTI02_Sentinel\DSSTI02_Sentinel.opj"
$dirPrj3 = "$HOME\OneDrive - Integrated Micro-Electronics Inc\Design\Projects\DSACM01\Schematic\DSACM01.opj"
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

function Project_Folder_Heirarchy {
  [CmdletBinding(SupportsShouldProcess)]
  param (
    [string]$Name
  )
  if ( Test-Path -Path ".\$Name") {
    Write-Warning "$Name already exist."
  } else {
    New-item -Name $Name -Path . -ItemType Directory -ErrorAction Ignore
    "Docs", "Datasheet", "Schematic" | ForEach-Object {New-item -Name "$_" -Path ".\$Name" -ItemType "Directory" -ErrorAction "Ignore"}
    "BackUp", "Version" | ForEach-Object {New-Item -Name "$_" -Path ".\$Name\Schematic" -ItemType "Directory" -ErrorAction "Ignore"}
    "Report", "Upload", "Reference" | ForEach-Object {New-Item -Name "$_" -Path ".\$Name\Docs" -ItemType "Directory" -ErrorAction "Ignore"}
    New-Item -Name "$Name Schematic" -Path .\$Name\Docs\Upload -ItemType "Directory" -ErrorAction "Ignore"
    Write-Output "`n[$Name project sub-folders generated.]"
  }
}
Set-Alias -Name Build-Project -Value Project_Folder_Heirarchy

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
    } elseif ($Name -eq "prof") {
      Start-Process $prof
    } elseif ($Name -eq "prj1") {
      Start-Process $dirPrj1
    } elseif ($Name -eq "prj2") {
      Start-Process $dirPrj2
    } elseif ($Name -eq "prj3") {
      Start-Process $dirPrj3
    } elseif ($Name -eq "snptl") {
      Start-Process "snippingtool"
    } elseif ($Name -eq "pcb") {
      Start-Process "C:\Cadence\SPB_17.2\tools\bin\allegro.exe"
    } elseif ($Name -eq "sch") {
      Start-Process "C:\Cadence\SPB_17.2\tools\bin\capture.exe"
    } elseif ($Name -eq "pad") {
      Start-Process "C:\Cadence\SPB_17.2\tools\bin\padstack_editor.exe"
    } elseif ($Name -eq "bom") {
      Start-Process 'C:\Users\GAIA\Documents\Design\Cadence Configuration reference\BOM processing tool.xlsm'
    } elseif ($Name -eq "word") {
      Start-Process 'C:\Program Files (x86)\Microsoft Office\root\Office16\winword.exe' -WindowStyle Maximized
      Clear-Host
      Write-Output "[executing Microsoft Word]" 
    } elseif ($Name -eq "excel") {
      Start-Process 'C:\Program Files (x86)\Microsoft Office\root\Office16\excel.exe' -WindowStyle Maximized
      Clear-Host
      Write-Output "[executing Microsoft Excel]" 
    } elseif ($Name -eq "powerpnt") {
      Start-Process 'C:\Program Files (x86)\Microsoft Office\root\Office16\powerpnt.exe' -WindowStyle Maximized
      Clear-Host
      Write-Output "[executing Microsoft PowerPoint]" 
    } elseif ($Name -eq "outlook") {
      Start-Process "C:\Program Files (x86)\Microsoft Office\root\Office16\OUTLOOK.EXE" -WindowStyle Maximized
      Clear-Host
      Write-Output "[executing Microsoft Outlook]" 
    }elseif ($Name -eq "datasheet") {
      Start-Process 'C:\Users\GAIA\OneDrive - Integrated Micro-Electronics Inc\Datasheet'
    } elseif ($Name -eq "review") {
      Start-Process 'C:\Users\GAIA\OneDrive - Integrated Micro-Electronics Inc\Design\Projects\Review'
    } elseif ($Name -eq "prjdir") {
      Start-Process $prjDir
    } elseif ($Name -eq "ref") {
      Start-Process 'C:\Users\GAIA\Documents\Design\Projects\reference'
    } else {
      Write-Warning "[$Name not found.]" 
    }
  }
}
Set-Alias -name open -value Open-Application

function Close-Application {

  [CmdletBinding(SupportsShouldProcess)]
  param ( 
    [string]$Name
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
    $_staOutlook = Get-Process -Name "outlook" -ErrorAction SilentlyContinue
    Write-Output "[closing $Name]" 

    if (($_openQbit.HasExited -eq $false) -and ($Name -eq "qbit")) {
      Stop-Process -Name "qbittorrent"
    } elseif (($_setAlias.HasExited -eq $false) -and ($Name -eq "code")) {
      Stop-Process -Name "Code - Insiders"
    } elseif (($_open_Edge.HasExited -eq $false) -and ($Name -eq "edge")) {
      Stop-Process -InputObject $_open_Edge
    } elseif (($_openWinWord.HasExited -eq $false) -and ($Name -eq "word")) {
      Stop-Process -InputObject $_openWinWord
    } elseif (($_sniptool.HasExited -eq $false) -and ($Name -eq "edge")) {
      Stop-Process -Name "snippingtool"
    } elseif ((($_openExcel.HasExited -eq $false) -or ($_staBomTool.HasExited -eq $false)) -and ($Name -eq "excel")) {
      Stop-Process -Name "EXCEL"
    } elseif (($_openPowerPnt.HasExited -eq $false) -and ($Name -eq "powerpnt")) {
      Stop-Process -InputObject $_openPowerPnt
    } elseif ((($_staPrj1.HasExited -eq $false) -or ($_staPrj2.HasExited -eq $false)) -and ($Name -eq "Capture")) {
      Stop-Process -Name "Capture"
    } elseif ((($_staReference.HasExited -eq $false) -or ($_staDatasheet.HasExited -eq $false) -or ($_staDatasheet1.HasExited -eq $false) -or ($_staDatasheet2.HasExited -eq $false) -or ($_staMovies.HasExited -eq $false) -or ($_prjdirectory.HasExited -eq $false)) -and ($Name -eq "explorer")) {
      Stop-Process -Name "explorer"
    } elseif (($_staMsTeams.HasExited -eq $false) -and ($Name -eq "teams")) {
      Stop-Process -InputObject $_staMsTeams
    } elseif (($_staMsTeams.HasExited -eq $false) -and ($Name -eq "outlook")) {
      Stop-Process -InputObject $_staOutlook
    } elseif ($Name -eq "all") {
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
      Stop-Process -Name "outlook" -ErrorAction SilentlyContinue
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

#. 'C:\tools\poshgit\dahlbyk-posh-git-9bda399\install.ps1'