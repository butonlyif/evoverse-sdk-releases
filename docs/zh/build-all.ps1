# EvoVerse SDK 客户文档一键构建
[CmdletBinding()]
param(
    [switch] $Force = $false,
    [string] $PythonPath = $env:EVOVERSE_PYTHON
)

$ScriptDir = if ($PSScriptRoot) { $PSScriptRoot } else { Split-Path -Parent $MyInvocation.MyCommand.Path }
$arguments = @("-NoProfile", "-ExecutionPolicy", "Bypass", "-File", (Join-Path $ScriptDir "build-site.ps1"))
if ($Force) { $arguments += "-Force" }
if ($PythonPath) { $arguments += @("-PythonPath", $PythonPath) }
& powershell @arguments
if ($LASTEXITCODE -ne 0) { throw "Customer documentation build failed." }

Write-Host "Generated: docs/site/customer-portal.html" -ForegroundColor Green
Write-Host "Legacy entry: docs/site/evoverse.html -> customer-portal.html" -ForegroundColor DarkGray
