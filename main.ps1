# Tar emot IP-adressen som användaren vill slå upp.
# Om ingen IP-adress skickas in får användaren skriva in den.
param (
    [Parameter(Mandatory = $false)]
    [string]$IpAddress
)

try {
    # Importerar projektets egna moduler.
    # $PSScriptRoot gör att sökvägarna fungerar oavsett varifrån scriptet körs.
    Import-Module (Join-Path $PSScriptRoot "modules/IpInfo.Env.psm1") -Force
    Import-Module (Join-Path $PSScriptRoot "modules/IpInfo.Api.psm1") -Force
    Import-Module (Join-Path $PSScriptRoot "modules/IpInfo.Format.psm1") -Force

    # Om ingen IP-adress skickas in frågar scriptet användaren.
    if ([string]::IsNullOrWhiteSpace($IpAddress)) {
        $IpAddress = Read-Host "Skriv in IP-adress"
    }

    # Om användaren fortfarande inte har skrivit någon IP-adress avslutas scriptet.
    if ([string]::IsNullOrWhiteSpace($IpAddress)) {
        Write-Host "Ingen IP-adress angavs. Scriptet avslutas." -ForegroundColor Yellow
        return
    }

    # Läser in API-token från .env-filen.
    Import-IpInfoEnv -Path (Join-Path $PSScriptRoot ".env")

    # Hämtar information om IP-adressen från IPinfo API.
    $result = Get-IpInfo -IpAddress $IpAddress

    # Visar API-svaret i lättläst format.
    Show-IpInfoResult -IpInfo $result
}
catch {
    Write-Host ""
    Write-Host "Ett fel uppstod:" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
}
finally {
    # Stannar scriptet så att användaren kan se resultatet eller felmeddelandet.
    Write-Host ""
    Read-Host "Tryck Enter för att avsluta"
}