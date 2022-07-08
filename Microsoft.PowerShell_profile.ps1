#Import-Module 'C:\tools\poshgit\dahlbyk-posh-git-9bda399\src\posh-git.psd1'
Add-PoshGitToProfile -Force

$env:Path += ";C:\Users\bryndell.torio\Documents\WindowsPowerShell\Custom"

#variable defined for quick folder switch.
[string]$prjDir = "$HOME\OneDrive - Integrated Micro-Electronics Inc\Design\Projects\"
[string]$prof = "$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
[string]$dirPrj1 = "$HOME\OneDrive - Integrated Micro-Electronics Inc\Design\Projects\DSSTI02_Control\Schematic\*.opj"
[string]$dirPrj2 = "$HOME\OneDrive - Integrated Micro-Electronics Inc\Design\Projects\DSSTI02_Sentinel\Schematic\*.opj"
[string]$dirPrj3 = "$HOME\OneDrive - Integrated Micro-Electronics Inc\Design\Projects\DSACM01\Schematic\*.opj"

# First system config for windows 10.
function toff { shutdown /p }
Set-Alias shortcut 'toff'
function reset { shutdown /r }
Set-Alias shortcut 'reset'
function openPsAdmin { 
  Start-Process -Filepath "powershell" -Verb runas -WindowStyle Maximized 
  }
Set-Alias -name admin -value openPsAdmn
function cdMovies {
  Set-Location C:\Movies
  }
Set-Alias -name movies -value cdMovies

function Build-File {
  [CmdletBinding(SupportsShouldProcess)]
  param (
    [string]$Name
  )

  process {
    if ($Name.ToLower() -eq "desup") {
      if ((Test-Path .\..\Docs) -and (Test-Path .\..\Docs\Upload) -and (Test-Path .\..\Datasheet) -and (Test-Path .\..\Schematic) -and (Test-Path .\*.dsn) -and (Test-Path .\*.xlsx)) {
        $_tmp = Get-ChildItem *.DSN
        $_splitTmp = $_tmp -split '\\'
        $_folderName = $_splitTmp[$_splitTmp.Length - 1] -split '\.'
        $_folderName = $_folderName[0]      #Takes the filename of the folder.
        if ((Test-Path ".\..\Docs\Upload\Schematic\*.xlsx") -and (Test-Path ".\..\Docs\Upload\Schematic\*.zip")) {
          Move-Item -Path ".\..\Docs\Upload\Schematic\*.xlsx" -Destination ".\..\Docs\BackUp\Schematic\$_folderName-$(get-date -f HHmmss-MMddyy).zip"
          Move-Item -Path ".\..\Docs\Upload\Schematic\*.zip" -Destination ".\..\Docs\BackUp\Schematic\$_folderName-$(get-date -f HHmmss-MMddyy).xlsx"     #Move the previous version into a BackUp folder.
        }
        Copy-Item *.xlsx -Destination "..\Docs\Upload\Schematic\"
        Get-ChildItem *.opj, *.dsn, *.bom, *.net, *.olb, *.drc, *.pdf | Compress-Archive -DestinationPath "..\Docs\Upload\Schematic\$_folderName Schematic"-Force #Copy the files into a zip folder then store to Upload folder.
        Start-Process "..\Docs\Upload\Schematic\" -Confirm
        Clear-Host
      }
      else {
        Write-Warning "Not standard folder structure. Use 'Build-Project' cmdlet instead or Check if schematic files are complete."
      }
    } elseif ($Name.ToLower() -eq "repup") {
      if ((Test-Path .\..\..\Projects) -and (Test-Path .\Docs) -and (Test-Path .\Docs) -and (Test-Path .\Docs)) {
        if (Test-Path -Path ".\Docs\Report\*HW Technical Plan*") { 
          [string]$_tmp1 = Get-ChildItem ".\Docs\Report\*HW Technical Plan*"
          $_splitTmp1 = $_tmp1 -split '\\'
          $_TechPlan = $_splitTmp1[$_splitTmp1.Length - 1] -split '\.'
          $_TechPlan = $_TechPlan[0]      #Takes the filename of the folder.
          Move-Item -Path ".\Docs\Upload\Report\*Technical Plan*" -Destination  ".\Docs\BackUp\Report\$_TechPlan - $(get-date -f HHmmss-MMddyy).docx"
          Copy-Item -Path '.\Docs\Report\*Technical Plan*' -Destination ".\Docs\Upload\Report"
        }
        else {
          Write-Warning "HW Technical Plan file not found." 
        }
        if (Test-Path -Path ".\Docs\Report\*Design Report*") { 
          [string]$_tmp2 = Get-ChildItem ".\Docs\Report\*Design Report*"
          $_splitTmp2 = $_tmp2 -split '\\'
          $_DesRep = $_splitTmp2[$_splitTmp2.Length - 1] -split '\.'
          $_DesRep = $_DesRep[0]      #Takes the filename of the folder.
          Move-Item -Path ".\Docs\Upload\Report\*Design Report*" -Destination  ".\Docs\BackUp\Report\$_DesRep - $(get-date -f HHmmss-MMddyy).docx"
          Copy-Item -Path '.\Docs\Report\*Design Report*' -Destination ".\Docs\Upload\Report"
        }
        else {
          Write-Warning "Design report file not found."
        }
        if (Test-Path -Path ".\Docs\Report\*Power Calculations*") { 
          [string]$_tmp3 = Get-ChildItem ".\Docs\Report\*Power Calculations*"
          $_splitTmp3 = $_tmp3 -split '\\'
          $_PowCal = $_splitTmp3[$_splitTmp3.Length - 1] -split '\.'
          $_PowCal = $_PowCal[0]      #Takes the filename of the folder.
          Move-Item -Path ".\Docs\Upload\Report\*Power Calculations*" -Destination  ".\Docs\BackUp\Report\$_PowCal - $(get-date -f HHmmss-MMddyy).xlsx"
          Copy-Item -Path '.\Docs\Report\*Power Calculations*' -Destination ".\Docs\Upload\Report"
        }
        else {
          Write-Warning "Power calculations file not found." 
        }
        Start-Process ".\Docs\Upload\Report\" -Confirm
        Clear-Host
      }
      else {
        Write-Warning "Not in proper project directory. Check current location."
      }
    }
  }
}

function Build-Project {
   [CmdletBinding(SupportsShouldProcess)]
  param (
    [string]$Name
  ) 
  
  process {
    $_tmp = Get-Location
    $_tmp = $_tmp -split '\\'
    if (($_tmp[$_tmp.Length - 1] -eq "Project") -or ($_tmp[$_tmp.Length - 1] -eq "Projects") -or ($_tmp[$_tmp.Length - 1] -eq "tmp")) {
      if (Test-Path -Path ".\*$Name*") {
        Write-Warning "$Name already exist."
      }
      else {
        New-item -Name $Name -Path . -ItemType Directory -ErrorAction Ignore
        "Docs", "Datasheet", "PCB", "Schematic" | ForEach-Object { New-item -Name "$_" -Path ".\$Name" -ItemType "Directory" -ErrorAction "Ignore" }
        "Footprint", "Pad", "Gerber" | ForEach-Object { New-item -Name "$_" -Path ".\$Name\PCB" -ItemType "Directory" -ErrorAction "Ignore" }
        "BackUp", "Version", "Report", "Upload", "Reference", "Pictures" | ForEach-Object { New-Item -Name "$_" -Path ".\$Name\Docs" -ItemType "Directory" -ErrorAction "Ignore" }
        "Schematic", "Report" | ForEach-Object {  New-item -Name "$_" -Path ".\$Name\Docs\BackUp" -ItemType "Directory" -ErrorAction "Ignore"; New-item -Name "$_" -Path ".\$Name\Docs\Upload" -ItemType "Directory" -ErrorAction "Ignore"; }
        Write-Output "`n[$Name project sub-folders generated.]"
      }
    } else {
      Write-Warning "Check project location."
    }
  }
}

function Remove-GitFolder {

  param (
    [string]$Name
  )
  process {
    if(Test-Path("$Name/.git")) {
    Remove-Item -Force $Name/.git;
    Remove-Item -Force $Name;
    } else {
      if (Test-Path .\$Name) {
        Write-Warning "$Name not a git folder. Use 'Remove-Item' instead."
      } else {
        Write-Warning "$Name not found."
      }
    }
  }


}

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
      Start-Process -FilePath "C:\Program Files\Microsoft VS Code\bin\code.cmd" $prof
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
    } elseif ($Name -eq "lp") {
      Start-Process "$HOME\OneDrive - Integrated Micro-Electronics Inc\Design\Software\LP Calculator V2010\LP_Calculator.exe"
    } elseif ($Name -eq "saturn") {
      Start-Process "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Saturn PCB Toolkit\PCB Toolkit V8.01.lnk"
    } elseif ($Name -eq "bom") {
      Start-Process "$HOME\OneDrive - Integrated Micro-Electronics Inc\Design\Cadence Configuration reference\BOM processing tool.xlsm"
    } elseif ($Name -eq "word") {
      Start-Process '"C:\Program Files\Microsoft Office\root\Office16\WINWORD.EXE"' -WindowStyle Maximized
      Clear-Host
      Write-Output "[executing Microsoft Word]" 
    } elseif ($Name -eq "teams") {
      Start-Process ms-teams:
    } elseif ($Name -eq "excel") {
      Start-Process '"C:\Program Files\Microsoft Office\root\Office16\EXCEL.EXE"' -WindowStyle Maximized
      Clear-Host
      Write-Output "[executing Microsoft Excel]" 
    } elseif ($Name -eq "powerpnt") {
      Start-Process '"C:\Program Files\Microsoft Office\root\Office16\POWERPNT.EXE"' -WindowStyle Maximized
      Clear-Host
      Write-Output "[executing Microsoft PowerPoint]" 
    } elseif ($Name -eq "outlook") {
      Start-Process "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE" -WindowStyle Maximized
      Clear-Host
      Write-Output "[executing Microsoft Outlook]" 
    } elseif ($Name -eq "datasheet") {
      Start-Process 'C:\Users\GAIA\OneDrive - Integrated Micro-Electronics Inc\Datasheet'
    } elseif ($Name -eq "review") {
      Start-Process 'C:\Users\GAIA\OneDrive - Integrated Micro-Electronics Inc\Design\Projects\Review'
    } elseif ($Name -eq "prjdir") {
      Start-Process $prjDir
    } elseif ($Name -eq "ref") {
      Start-Process 'C:\Users\GAIA\Documents\Design\Projects\reference'
    } elseif ($Name -eq "github") {
      Start-Process microsoft-edge:https://github.com/BryndellTorio
    } elseif ($Name -eq "edraw") {
      Start-Process "C:\Program Files (x86)\Edrawsoft\EdrawMax\EdrawMax.exe"
    } elseif ($Name -eq "gitmind") {
      Start-Process "C:\Program Files (x86)\Apowersoft\GitMind\GitMind.exe"
    } else {
      Write-Warning "[$Name not found.]" 
    }
  }
}
Set-Alias -name open -value Open-Application

function Close-Application {
  param ( 
    [string]$Name
  )

  process {
    Write-Output "[closing $Name]" 

    if ($Name -eq "qbit") {
      Stop-Process -Name "qbittorrent"
    } elseif ($Name.ToLower() -eq "code") {
      Stop-Process -Name "Code - Insiders"
    } elseif ($Name.ToLower() -eq "edge") {
      Stop-Process -Name "msedge"
    } elseif ($Name.ToLower() -eq "word") {
      Stop-Process -Name "WINWORD"
    } elseif ($Name.ToLower() -eq "edge") {
      Stop-Process -Name "snippingtool"
    } elseif ($Name.ToLower() -eq "excel") {
      Stop-Process -Name "EXCEL"
    } elseif ($Name.ToLower() -eq "powerpnt") {
      Stop-Process -Name "Powerpnt"
    } elseif ($Name.ToLower() -eq "Capture") {
      Stop-Process -Name "Capture"
    } elseif ($Name.ToLower() -eq "explorer") {
      Stop-Process -Name "explorer"
    } elseif ($Name.ToLower() -eq "teams") {
      Stop-Process -Name "teams"
    } elseif ($Name.ToLower() -eq "outlook") {
      Stop-Process -Name "Outlook"
    } elseif ($Name.ToLower() -eq "lp") {
      Stop-Process -Name "LP_Calculator"
    } elseif ($Name.ToLower() -eq "all") {
      Get-Process | Where-Object {$_.MainWindowTitle} | Stop-Process
    } else {
      Write-Output "Application not found."
    }
  }
}
Set-Alias -Name close -value Close-Application

# #elseif ($Name.ToLower() -eq "all") {
#     "POWERPNT", "EXCEL", "WINWORD", "Msedge", "Code - Insiders", "qbittorrent", 
#     "SnippingTool", "teams", "explorer", "Capture", "LP_Calculator", "outlook",
#     "Move Mouse", "FoxitPDFReader", "Code" | ForEach-Object { Stop-Process -Name "$_" -ErrorAction Ignore }
#     }

function Ohayou {
  [CmdletBinding(SupportsShouldProcess)]
  param (
    
  )
  
  process {
    "http://192.168.63.9/elog/", "https://webportal.global-imi.com/CommonLogin/Login?sysid=pNm0fj7kDN%252FwtNs4mWRs7A%253D%253D", "https://webportal.global-imi.com/CommonLogin/Login?sysid=eWbbLBrMaUoYEjbv2Xy1wg%253D%253D", "https://bryndelltorio.kanbantool.com/b/751627#?", "http://phlagspfe1/TeamSites/DND/ph/SitePages/DD%20Process%20Revision%202017.aspx", "https://octopart.com/" | ForEach-Object { Start-Process microsoft-edge:$_ }
    Start-Process "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE" -WindowStyle Maximized
    $_ohayouTmp = $HOME -split '\\'
    $_ohayouTmp = $_ohayouTmp[$_ohayouTmp.Length -1]
    Write-Output "Good morning $_ohayouTmp!"
  }
}

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
Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git

Import-Module posh-git
