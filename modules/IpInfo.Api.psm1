# Hämtar information om en IP-adress från IPinfo API.
function Get-IpInfo {
    param (
        # IP-adressen är obligatorisk när funktionen körs.
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$IpAddress
    )

    # Kontrollerar att API-token har lästs in från .env.
    if (-not $env:IPINFO_TOKEN) {
        throw "IPINFO_TOKEN saknas. Kör Import-IpInfoEnv först."
    }

    # Bygger API-adressen med den IP-adress som användaren anger.
    $uri = "https://api.ipinfo.io/lite/$IpAddress"

    # Skickar API-token som Bearer token.
    $headers = @{
        Authorization = "Bearer $env:IPINFO_TOKEN"
    }

    # Gör GET-anropet till API:et.
    # Invoke-RestMethod omvandlar JSON-svaret till ett PowerShell-objekt.
    $response = Invoke-RestMethod -Uri $uri -Headers $headers -Method Get

    # Returnerar API-svaret till main.ps1.
    return $response
}

# Gör funktionen tillgänglig när modulen importeras.
Export-ModuleMember -Function Get-IpInfo