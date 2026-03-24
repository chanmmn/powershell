# Get all physical network adapters that are up
$adapters = Get-NetAdapter | Where-Object { $_.Status -eq "Up" }

foreach ($adapter in $adapters) {
    Write-Host "Setting DNS for adapter: $($adapter.Name)"

    # Set primary and secondary DNS
    Set-DnsClientServerAddress `
        -InterfaceAlias $adapter.Name `
        -ServerAddresses @("8.8.8.8","8.8.4.4")
}

Write-Host "DNS has been updated to 8.8.8.8 and 8.8.4.4"