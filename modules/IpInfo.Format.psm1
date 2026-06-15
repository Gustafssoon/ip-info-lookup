# Visar IPinfo-resultatet i ett enklare format i terminalen.
function Show-IpInfoResult {
    param (
        # Tar emot objektet som kommer tillbaka från Get-IpInfo.
        [Parameter(Mandatory = $true)]
        $IpInfo
    )

    # Skriver ut valda delar av API-svaret.
    Write-Host "IP-information"
    Write-Host "--------------"
    Write-Host "IP-adress:  $($IpInfo.ip)"
    Write-Host "Land:       $($IpInfo.country)"
    Write-Host "Kontinent:  $($IpInfo.continent)"
}

# Gör funktionen tillgänglig när modulen importeras.
Export-ModuleMember -Function Show-IpInfoResult