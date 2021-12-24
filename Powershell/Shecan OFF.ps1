Get-DnsClientServerAddress -AddressFamily IPv4
Write-Host ""
Write-Host 'Enter Network Adapter Index Number From Above List' -ForegroundColor Yellow
$I = Read-Host -Prompt 'Interface Index'
Set-DnsClientServerAddress -InterfaceIndex $I -ResetServerAddresses
Write-Host "Network DNS RESET Successfully."


$inputFound = $false
Do {
    $I = Read-Host -Prompt 'Interface Index'
    
    If ($I -ne "" -and $I -ne $null) {
        Set-DnsClientServerAddress -InterfaceIndex $I -ResetServerAddresses
        Write-Host "Network DNS RESET Successfully."
        $inputFound = $true
    }
}
While ($inputFound -eq $false)