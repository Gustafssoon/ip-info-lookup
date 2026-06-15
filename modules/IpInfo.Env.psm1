# Läser in miljövariabler från en .env-fil.
function Import-IpInfoEnv {
    param (
        # Standardvärdet är .env i projektets rotmapp.
        [string]$Path = ".env"
    )

    # Stoppar scriptet om .env-filen saknas.
    if (-not (Test-Path $Path)) {
        throw ".env-filen hittades inte. Skapa en .env-fil med IPINFO_TOKEN=din_token."
    }

    # Läser .env-filen rad för rad.
    Get-Content $Path | ForEach-Object {
        # Hoppar över tomma rader och kommentarsrader.
        if ($_ -match "^\s*$" -or $_ -match "^\s*#") {
            return
        }

        # Delar upp raden i namn och värde.
        # Exempel: IPINFO_TOKEN=123456
        $parts = $_ -split "=", 2

        if ($parts.Count -eq 2) {
            $name = $parts[0].Trim()
            $value = $parts[1].Trim()

            # Skapar en miljövariabel i aktuell PowerShell-session.
            [System.Environment]::SetEnvironmentVariable($name, $value, "Process")
        }
    }

    # Kontrollerar att just IPINFO_TOKEN finns efter inläsningen.
    if (-not $env:IPINFO_TOKEN) {
        throw "IPINFO_TOKEN saknas i .env-filen."
    }
}

# Gör funktionen tillgänglig när modulen importeras.
Export-ModuleMember -Function Import-IpInfoEnv