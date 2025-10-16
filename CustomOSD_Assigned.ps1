# Assigned devices naming: CCC-<Serial>
try {
    $serial = (Get-CimInstance Win32_BIOS).SerialNumber -replace '\s',''
    $newName = "CCC-$serial".Substring(0, [math]::Min(15, "CCC-$serial".Length))
    Write-Host "Setting computer name to $newName"
    reg add "HKLM\System\Setup" /v "ComputerName" /t REG_SZ /d $newName /f | Out-Null
}
catch {
    Write-Warning "Failed to set computer name"
}
