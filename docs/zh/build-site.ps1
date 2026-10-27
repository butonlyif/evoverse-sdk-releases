# EvoVerse SDK 客户离线门户生成器
[CmdletBinding()]
param(
    [switch] $Force = $false,
    [string] $PythonPath = $env:EVOVERSE_PYTHON
)

$ErrorActionPreference = "Stop"
$ScriptDir = if ($PSScriptRoot) { $PSScriptRoot } else { Split-Path -Parent $MyInvocation.MyCommand.Path }
$Root = (Resolve-Path (Join-Path $ScriptDir "..\..")).Path
$candidates = @()
if ($PythonPath) { $candidates += $PythonPath }
foreach ($name in @("python", "python3")) {
    $command = Get-Command $name -ErrorAction SilentlyContinue
    if ($command) { $candidates += $command.Source }
}
$Python = $null
foreach ($candidate in ($candidates | Select-Object -Unique)) {
    & $candidate -c "import encodings, json, pathlib" 2>$null
    if ($LASTEXITCODE -eq 0) { $Python = $candidate; break }
}
if (-not $Python) { throw "A working Python 3.11+ is required. Pass -PythonPath or set EVOVERSE_PYTHON." }

$Generator = Join-Path $Root "scripts\customer_docs.py"
$Portal = Join-Path $ScriptDir "customer-portal.html"
& $Python $Generator "build" --root $Root --output $Portal
if ($LASTEXITCODE -ne 0) { throw "Customer portal generation failed." }

# Keep the historic evoverse.html entry working without maintaining a second portal.
$Legacy = Join-Path $ScriptDir "evoverse.html"
$redirect = @'
<!doctype html><html lang="zh-CN"><head><meta charset="utf-8">
<meta http-equiv="refresh" content="0; url=customer-portal.html">
<title>EvoVerse SDK 文档入口已更新</title></head>
<body><p>文档入口已更新：<a href="customer-portal.html">打开客户文档门户</a></p></body></html>
'@
[System.IO.File]::WriteAllText($Legacy, $redirect, [System.Text.UTF8Encoding]::new($false))
Write-Host "Customer portal: $Portal" -ForegroundColor Green
