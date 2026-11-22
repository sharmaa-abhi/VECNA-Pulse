@echo off
title VECNA-Pulse Launcher
echo ===================================================
echo           Starting VECNA-Pulse Workstation
echo ===================================================
echo.

:: 1. Launch Backend in a new terminal window
echo [1/2] Launching Backend Server on http://127.0.0.1:8000 ...
start "VECNA-Pulse Backend (Port 8000)" cmd /k "cd /d %~dp0backend && (where uv >nul 2>nul && uv run uvicorn app.main:app --host 127.0.0.1 --port 8000 --reload || python -m uvicorn app.main:app --host 127.0.0.1 --port 8000 --reload)"

:: 2. Launch Frontend in a new terminal window
echo [2/2] Launching Frontend Server on http://localhost:3000 ...
start "VECNA-Pulse Frontend (Port 3000)" cmd /k "cd /d %~dp0frontend && npm run dev"

echo.
echo ===================================================
echo Services started in separate terminal windows!
echo - Frontend UI:  http://localhost:3000
echo - Backend API:  http://127.0.0.1:8000/api/health
echo ===================================================
pause
