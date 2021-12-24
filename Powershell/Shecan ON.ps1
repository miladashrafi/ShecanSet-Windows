$WebResponse = Invoke-WebRequest "https://shecan.ir"
$DnsElementList = $WebResponse.AllElements | Where {$_.Class -eq "shecan-dns-ips"}
$DnsList = @()
for ($Index = 1; $Index -le 2; $Index++)
{
    $DnsList += '"' + $DnsElementList[$Index-1].innerText + '"'
}
$Value = '(' + ($DnsList -join ',') + ')'

Get-DnsClientServerAddress -AddressFamily IPv4
Write-Host ""
Write-Host 'Enter Network Adapter Index Number From Above List' -ForegroundColor Yellow
$I = Read-Host -Prompt 'Interface Index'
Set-DnsClientServerAddress -InterfaceIndex $I -ServerAddresses $Value
Write-Host "Network DNS SET Successfully."
