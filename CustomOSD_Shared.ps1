# =====================================================================
# Cornerstone Community Church - Shared Device Setup
# =====================================================================

Write-Host "Applying Shared device settings..." -ForegroundColor Cyan

try {
    # Get serial number and remove spaces
    $serial = (Get-CimInstance Win32_BIOS).SerialNumber -replace '\s',''

    # Build name: SHR-<Serial>, truncated to 15 chars (Windows limit)
    $newName = "SHR-$serial".Substring(0, [math]::Min(15, ("SHR-$serial").Length))
    Write-Host "Setting computer name to $newName" -ForegroundColor Green

    # Set name for OOBE (so it's used after reboot)
    reg add "HKLM\System\Setup" /v "ComputerName" /t REG_SZ /d $newName /f | Out-Null

    # Set Autopilot GroupTag for Shared devices
    $GroupTag = "SharedDevice"
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\Provisioning\Diagnostics\AutoPilot" -Force | Out-Null
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Provisioning\Diagnostics\AutoPilot" -Name "GroupTag" -Value $GroupTag
    Write-Host "Group Tag set to $GroupTag" -ForegroundColor Green
}
catch {
    Write-Warning "⚠ Failed to set computer name or group tag: $($_.Exception.Message)"
}
