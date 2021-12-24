try{
    Get-DnsClientServerAddress -AddressFamily IPv4
    Write-Host ""
    Write-Host 'Enter Network Adapter Index Number From Above List' -ForegroundColor Yellow
    $inputFound = $false
    Do {
        $I = Read-Host -Prompt 'Interface Index'
        If ($I -ne "" -and $I -ne $null) {
            Write-Host "Please wait ..."
            Clear-Host
            Write-Host "Getting DNS(s) from Shecan.ir ..." -ForegroundColor Gray
            $WebResponse = Invoke-WebRequest "https://shecan.ir" -ForegroundColor Gray
            $DnsElementList = $WebResponse.AllElements | Where {$_.Class -eq "shecan-dns-ips"}
            $DnsList = @()
            for ($Index = 1; $Index -le 2; $Index++)
            {
                Write-Host "DNS"$Index":" $DnsElementList[$Index-1].innerText -ForegroundColor Red
                $DnsList += '"' + $DnsElementList[$Index-1].innerText + '"'
            }
            $Value = '(' + ($DnsList -join ',') + ')'
            Invoke-Expression "Set-DnsClientServerAddress -InterfaceIndex $I -ServerAddresses $Value"
            Clear-Host
            Write-Host "Network DNS SET Successfully." -ForegroundColor Green
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



