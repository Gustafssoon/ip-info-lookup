function Import-IpInfoEnv {
    param (
        [string]$Path = ".env"
    )

    if (-not (Test-Path $Path)) {
        throw ".env-filen hittades inte."
    }

    Get-Content $Path | ForEach-Object {
        $parts = $_ -split "=", 2

        if ($parts.Count -eq 2) {
            $name = $parts[0].Trim()
            $value = $parts[1].Trim()

            [System.Environment]::SetEnvironmentVariable($name, $value, "Process")
        }
    }
}

Export-ModuleMember -Function Import-IpInfoEnv