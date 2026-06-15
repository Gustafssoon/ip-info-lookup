# Tar emot IP-adressen som användaren vill slå upp.
param (
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$IpAddress
)

# Importerar projektets egna moduler.
# $PSScriptRoot gör att sökvägarna fungerar oavsett varifrån scriptet körs.
Import-Module (Join-Path $PSScriptRoot "modules/IpInfo.Env.psm1") -Force
Import-Module (Join-Path $PSScriptRoot "modules/IpInfo.Api.psm1") -Force
Import-Module (Join-Path $PSScriptRoot "modules/IpInfo.Format.psm1") -Force

# Läser in API-token från .env-filen.
Import-IpInfoEnv -Path (Join-Path $PSScriptRoot ".env")

# Hämtar information om IP-adressen från IPinfo API.
$result = Get-IpInfo -IpAddress $IpAddress

# Visar API-svaret i lättläst format.
Show-IpInfoResult -IpInfo $result