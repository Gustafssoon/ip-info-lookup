function Show-IpInfoResult {
    param (
        [Parameter(Mandatory = $true)]
        $IpInfo
    )

    Write-Host "IP-information"
    Write-Host "--------------"
    Write-Host "IP-adress:  $($IpInfo.ip)"
    Write-Host "Land:       $($IpInfo.country)"
    Write-Host "Kontinent:  $($IpInfo.continent)"
}

Export-ModuleMember -Function Show-IpInfoResult