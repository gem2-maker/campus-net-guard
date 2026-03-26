$ErrorActionPreference = "Stop"

function Get-CampusDefaultRoute {
  $lines = route print -4
  $candidates = @()
  foreach ($raw in $lines) {
    $line = $raw.Trim()
    $match = [regex]::Match(
      $line,
      '^(0\.0\.0\.0)\s+(0\.0\.0\.0)\s+(\d{1,3}(?:\.\d{1,3}){3})\s+(\d{1,3}(?:\.\d{1,3}){3})\s+(\d+)$'
    )
    if (-not $match.Success) { continue }
    $gateway = $match.Groups[3].Value
    $ifaceIp = $match.Groups[4].Value
    if ($gateway -like '198.18.*' -or $ifaceIp -like '198.18.*') { continue }
    if (-not ($gateway -like '10.*' -or $gateway -like '172.*' -or $gateway -like '192.168.*')) { continue }
    $metric = [int]$match.Groups[5].Value
    $candidates += [pscustomobject]@{
      Gateway = $gateway
      InterfaceIp = $ifaceIp
      Metric = $metric
    }
  }
  $candidates | Sort-Object Metric | Select-Object -First 1
}

$route = Get-CampusDefaultRoute
if (-not $route) {
  throw "No campus default route found."
}

foreach ($target in @('172.19.0.5', '10.1.20.30')) {
  cmd /c "route -p add $target mask 255.255.255.255 $($route.Gateway) metric 5" | Out-Null
}

Write-Output "Persistent routes installed via $($route.Gateway)"
