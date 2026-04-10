# Get all network adapters that are up
$adapters = Get-NetAdapter | Where-Object { $_.Status -eq "Up" }

foreach ($adapter in $adapters) {
    Write-Host "Resetting DNS to automatic for adapter: $($adapter.Name)"

    Set-DnsClientServerAddress `
        -InterfaceAlias $adapter.Name `
        -ResetServerAddresses
}

Write-Host "DNS has been reset to Obtain DNS server address automatically (DHCP)"