function Import-IpInfoEnv {
    param (
        [string]$Path = ".env"
    )

    if (-not (Test-Path $Path)) {
        throw ".env-filen hittades inte."
    }

    Write-Host ".env-filen hittades."
}

Export-ModuleMember -Function Import-IpInfoEnv