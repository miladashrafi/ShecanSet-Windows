Get-DnsClientServerAddress -AddressFamily IPv4
Write-Host ""
Write-Host 'Enter Network Adapter Index Number From Above List' -ForegroundColor Yellow
$I = Read-Host -Prompt 'Interface Index'
Set-DnsClientServerAddress -InterfaceIndex $I -ResetServerAddresses
Write-Host "Network DNS RESET Successfully."
