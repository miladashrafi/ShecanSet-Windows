try{
    Get-DnsClientServerAddress -AddressFamily IPv4
    Write-Host ""
    Write-Host 'Enter Network Adapter Index Number From Above List' -ForegroundColor Yellow
    $inputFound = $false
    Do {
        $I = Read-Host -Prompt 'Interface Index'
        If ($I -ne "" -and $I -ne $null) {
            Set-DnsClientServerAddress -InterfaceIndex $I -ResetServerAddresses
            Clear-Host
            Write-Host "Network DNS RESET Successfully." -ForegroundColor Green
            $inputFound = $true
        }
    }
    While ($inputFound -eq $false)
}
catch{
    Clear-Host
    Write-Host "**** An error occurred:" -ForegroundColor Red
    Write-Host $_ -ForegroundColor Red
    Write-Host $_.ScriptStackTrace -ForegroundColor Red
}
