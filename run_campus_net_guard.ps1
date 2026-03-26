$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$scriptPath = Join-Path $PSScriptRoot "campus_net_guard.py"
$logDir = Join-Path $root "workspace\logs"
$stdoutLog = Join-Path $logDir "campus-net-guard.stdout.log"
$stderrLog = Join-Path $logDir "campus-net-guard.stderr.log"

New-Item -ItemType Directory -Path $logDir -Force | Out-Null

$python = (Get-Command python -ErrorAction Stop).Source
& $python $scriptPath 1>> $stdoutLog 2>> $stderrLog
