$WebResponse = Invoke-WebRequest "https://shecan.ir"
$DnsElementList = $WebResponse.AllElements | Where {$_.Class -eq "shecan-dns-ips"}
$DnsList = @()
for ($Index = 1; $Index -le 2; $Index++)
{
    Write-Host $DnsElementList[$Index-1].innerText -ForegroundColor Red
    $DnsList += '"' + $DnsElementList[$Index-1].innerText + '"'
}
$Value = '(' + ($DnsList -join ',') + ')'

Get-DnsClientServerAddress -AddressFamily IPv4
Write-Host ""
Write-Host $Value -ForegroundColor Red
Write-Host 'Enter Network Adapter Index Number From Above List' -ForegroundColor Yellow

$inputFound = $false
Do {
    $I = Read-Host -Prompt 'Interface Index'
    
    If ($I -ne "" -and $I -ne $null) {
        Invoke-Expression "Set-DnsClientServerAddress -InterfaceIndex $I -ServerAddresses $Value"
        Write-Host "Network DNS SET Successfully."
        $inputFound = $true
    }
}
While ($inputFound -eq $false)


