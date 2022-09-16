$myObject = [PSCustomObject]@{
    Name     = 'Kevin'
    Language = 'PowerShell'
    State    = 'Texas'
}

Write-Output  $myObject.Name
#$myObject.Name = 'John'
#Write-Output  $myObject[1].Name
#[PSCustomObject[]]$ia
$b = (New-Object 'object[]' 2)
$b[0] = $myObject
$myObject1 = [PSCustomObject]@{
    Name     = 'Chan'
    Language = 'PowerShell'
    State    = 'Texas'
}
$b[1] = $myObject1
Write-Output  $b[0].Name
Write-Output  $b[1].Name