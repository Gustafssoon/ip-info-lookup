param (
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$IpAddress
)

Import-Module (Join-Path $PSScriptRoot "modules/IpInfo.Env.psm1") -Force
Import-Module (Join-Path $PSScriptRoot "modules/IpInfo.Api.psm1") -Force
Import-Module (Join-Path $PSScriptRoot "modules/IpInfo.Format.psm1") -Force

Import-IpInfoEnv -Path (Join-Path $PSScriptRoot ".env")

$result = Get-IpInfo -IpAddress $IpAddress

Show-IpInfoResult -IpInfo $result