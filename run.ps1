# run.ps1 - VECNA-Pulse Launcher for PowerShell
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host "          Starting VECNA-Pulse Workstation         " -ForegroundColor Cyan
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host ""

$root = $PSScriptRoot

# 1. Start Backend in a new PowerShell window
Write-Host "[1/2] Launching Backend on http://127.0.0.1:8000 ..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "Set-Location '$root\backend'; if (Get-Command uv -ErrorAction SilentlyContinue) { uv run uvicorn app.main:app --host 127.0.0.1 --port 8000 --reload } else { python -m uvicorn app.main:app --host 127.0.0.1 --port 8000 --reload }"

# 2. Start Frontend in a new PowerShell window
Write-Host "[2/2] Launching Frontend on http://localhost:3000 ..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "Set-Location '$root\frontend'; npm run dev"

Write-Host ""
Write-Host "===================================================" -ForegroundColor Green
Write-Host "Both Backend and Frontend windows launched!" -ForegroundColor Green
Write-Host "Frontend UI:  http://localhost:3000" -ForegroundColor Cyan
Write-Host "Backend API:  http://127.0.0.1:8000/api/health" -ForegroundColor Cyan
Write-Host "===================================================" -ForegroundColor Green
