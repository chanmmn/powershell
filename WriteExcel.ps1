$ExcelObj = New-Object -comobject Excel.Application
$ExcelObj.visible=$true
$ExcelWorkBook = $ExcelObj.Workbooks.Open("C:\PS\corp_ad_users.xlsx")
$ExcelWorkBook.Sheets| fl Name, index
$ExcelWorkSheet = $ExcelWorkBook.Sheets.Item("CORP_users")
$ExcelWorkBook.ActiveSheet | fl Name, Index
$ExcelWorkSheet.Range("B4").Text
$ExcelWorkSheet.Range("B4:B4").Text
$ExcelWorkSheet.Range("B4","B4").Text
$ExcelWorkSheet.cells.Item(4, 2).text
$ExcelWorkSheet.cells.Item(4, 2).value2
$ExcelWorkSheet.Columns.Item(2).Rows.Item(4).Text
$ExcelWorkSheet.Rows.Item(4).Columns.Item(2).Text
$ExcelWorkSheet.Range("A6") = 'User'
$ExcelWorkSheet.Range("B6") = 'User'
$ExcelWorkSheet.Range("C4") = 'End user'
$ExcelWorkBook.Save()
$ExcelWorkBook.close($true)
$ExcelObj.Quit()
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($ExcelObj)
Remove-Variable ExcelObj
