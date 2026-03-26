$ErrorActionPreference = "Stop"

$taskName = "CampusNetGuard"
$runner = Join-Path $PSScriptRoot "run_campus_net_guard.ps1"
$currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name

$action = New-ScheduledTaskAction `
  -Execute "powershell.exe" `
  -Argument "-NoProfile -ExecutionPolicy Bypass -File `"$runner`""

$triggers = @(
  (New-ScheduledTaskTrigger -AtLogOn -User $currentUser)
)

$settings = New-ScheduledTaskSettingsSet `
  -AllowStartIfOnBatteries `
  -DontStopIfGoingOnBatteries `
  -MultipleInstances IgnoreNew `
  -StartWhenAvailable

Register-ScheduledTask `
  -TaskName $taskName `
  -Action $action `
  -Trigger $triggers `
  -Settings $settings `
  -Description "Monitor campus network and auto-login SRun when offline." `
  -User $currentUser `
  -Force | Out-Null

Write-Output "Scheduled task '$taskName' created."
