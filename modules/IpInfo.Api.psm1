function Get-IpInfo {
    param (
        [string]$IpAddress
    )

    if (-not $env:IPINFO_TOKEN) {
        throw "IPINFO_TOKEN saknas. Kör Import-IpInfoEnv först."
    }

    $uri = "https://api.ipinfo.io/lite/$IpAddress"

    $headers = @{
        Authorization = "Bearer $env:IPINFO_TOKEN"
    }

    $response = Invoke-RestMethod -Uri $uri -Headers $headers -Method Get

    return $response
}

Export-ModuleMember -Function Get-IpInfo