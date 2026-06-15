function Get-IpInfo {
    param (
        [string]$IpAddress
    )

    $uri = "https://api.ipinfo.io/lite/$IpAddress"

    return $uri
}

Export-ModuleMember -Function Get-IpInfo