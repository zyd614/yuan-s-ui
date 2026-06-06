#Requires -RunAsAdministrator
$ErrorActionPreference = "Stop"

$BaseUrl = "https://raw.githubusercontent.com/zyd614/yuan-s-ui/main"
$Version = "v1.4.2"

function Get-WindowsArch {
    if ($env:PROCESSOR_ARCHITECTURE -eq "ARM64") {
        return "arm64"
    }
    if ($env:PROCESSOR_ARCHITECTURE -eq "AMD64") {
        return "amd64"
    }
    throw "Unsupported architecture: $($env:PROCESSOR_ARCHITECTURE). Windows releases are available for amd64 and arm64 only."
}

$arch = Get-WindowsArch
$tempDir = Join-Path $env:TEMP ("s-ui-install-{0}" -f (Get-Random))
New-Item -ItemType Directory -Path $tempDir -Force | Out-Null
$zipPath = Join-Path $tempDir "s-ui-windows-$arch.zip"

Write-Host "Downloading latest S-UI for Windows ($arch)..."
Invoke-WebRequest -Uri "$BaseUrl/downloads/$Version/s-ui-windows-$arch.zip" -OutFile $zipPath -UseBasicParsing

Write-Host "Extracting..."
Expand-Archive -Path $zipPath -DestinationPath $tempDir -Force

$installDir = Join-Path $tempDir "s-ui-windows"
if (-not (Test-Path $installDir)) {
    throw "Unexpected archive layout: s-ui-windows folder not found"
}

Set-Location $installDir
Write-Host "Starting Windows installer..."
cmd /c "install-windows.bat"
