### Excel automation exercise

$excel = New-Object -ComObject Excel.Application

$excel.Visible = $true
$excel.DisplayAlerts = $false

$excel.Workbooks.Add()

$excel.Workbooks | Select-Object -ExpandProperty name

$excel.Workbooks.Item("book4").activate()
#$excel.Workbooks.Item("book5").activate()


$excel.Workbooks.Item((Get-Random -Minimum 1 -Maximum ($excel.Workbooks.Count + 1))).activate()

$excel.Workbooks.Item("book4").SaveAs("$env:userprofile\Desktop\excelAutomation.xlsx")


### working with worksheets

$excel.Worksheets.Add()
$excel.Worksheets | Select-Object -ExpandProperty name

$excel.Worksheets.Item(1).name = "Revision History"

$excel.Worksheets.Item(2).activate()
$excel.Worksheets.Item((Get-Random -Minimum 1 -Maximum($excel.Worksheets.Count+1))).activate()