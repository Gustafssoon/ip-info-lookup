function Import-IpInfoEnv {
    param (
        [string]$Path = ".env"
    )

    if (-not (Test-Path $Path)) {
        throw ".env-filen hittades inte. Skapa en .env-fil med IPINFO_TOKEN=din_token."
    }

    Get-Content $Path | ForEach-Object {
        if ($_ -match "^\s*$" -or $_ -match "^\s*#") {
            return
        }

        $parts = $_ -split "=", 2

        if ($parts.Count -eq 2) {
            $name = $parts[0].Trim()
            $value = $parts[1].Trim()

            [System.Environment]::SetEnvironmentVariable($name, $value, "Process")
        }
    }

    if (-not $env:IPINFO_TOKEN) {
        throw "IPINFO_TOKEN saknas i .env-filen."
    }
}

Export-ModuleMember -Function Import-IpInfoEnv