# if ((Test-Path .\..\Docs) -and (Test-Path .\..\Docs\Upload) -and (Test-Path .\..\Datasheet) -and (Test-Path .\..\Schematic)) {
#     $_tmp = Get-ChildItem *.DSN
#     $_splitTmp = $_tmp -split '\\'
#     $_folderName = $_splitTmp[$_splitTmp.Length - 1] -split '\.'
#     $_folderName = $_folderName[0]
#     if (!(Test-Path ".\..\Docs\Upload\$_folderName Schematic")) {
#         New-Item -Name "$_folderName Schematic" -ItemType Directory -Path .\..\Docs\Upload\
#     }
#     # Copy-Item *.opj, *.dsn, *.bom, *.net, *.olb, *.drc -Destination "..\Docs\Upload\$_folderName Schematic"
#     if (Test-Path ".\..\Docs\Upload\$_folderName Schematic.zip") {
#         Move-Item -Path ".\..\Docs\Upload\$_folderName Schematic.zip" -Destination ".\..\Docs\BackUp\$_folderName-$(get-date -f HHmm-MMddyy).zip"
#     }
#     Get-ChildItem *.opj, *.dsn, *.bom, *.net, *.olb, *.drc | Compress-Archive -DestinationPath "..\Docs\Upload\$_folderName Schematic" -Force
# } else {
#     Write-Warning "Not standard folder structure. Use 'Build-Project' cmdlet instead."
# }

 if ((Test-Path .\..\Docs) -and (Test-Path .\..\Docs\Upload) -and (Test-Path .\..\Datasheet) -and (Test-Path .\..\Schematic) -and (Test-Path .\*bom.xlsx)) {

 }

    # Remove-Variable -Name _tmp, _splitTmp #Remove temporary variables

# "http://192.168.63.9/elog/", "https://webportal.global-imi.com/CommonLogin/Login?sysid=pNm0fj7kDN%252FwtNs4mWRs7A%253D%253D", "https://webportal.global-imi.com/CommonLogin/Login?sysid=eWbbLBrMaUoYEjbv2Xy1wg%253D%253D", "https://bryndelltorio.kanbantool.com/b/751627#?", "http://phlagspfe1/TeamSites/DND/ph/SitePages/DD%20Process%20Revision%202017.aspx", "https://octopart.com/" | ForEach-Object { Start-Process microsoft-edge:$_ }
# [string]$dest = Get-ChildItem '*Schematics'
# Copy-Item *.NET -Destination $dest

