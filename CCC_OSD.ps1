Write-Host "----------------------------------------" -ForegroundColor Cyan
Write-Host "   Cornerstone Community Church OSDCloud" -ForegroundColor Cyan
Write-Host "----------------------------------------" -ForegroundColor Cyan
Write-Host ""
Write-Host "Select Device Type:" -ForegroundColor Yellow
Write-Host "1. Assigned Device"
Write-Host "2. Shared Device"
Write-Host ""

$selection = Read-Host "Enter your choice (1 or 2)"

switch ($selection) {
    1 {
        Write-Host "Launching Assigned Device build..." -ForegroundColor Green
        Invoke-Expression (irm "https://raw.githubusercontent.com/ccc-jmeddaugh/osdcornerstone/main/CustomOSD_Assigned.ps1")
    }
    2 {
        Write-Host "Launching Shared Device build..." -ForegroundColor Green
        Invoke-Expression (irm "https://raw.githubusercontent.com/ccc-jmeddaugh/osdcornerstone/main/CustomOSD_Shared.ps1")
    }
    default {
        Write-Host "Invalid selection. Please rerun script and choose 1 or 2." -ForegroundColor Red
        exit 1
    }
}
