@echo off
title NetPulse AI Launcher
echo ==============================================================
echo        NetPulse AI - Bandwidth Prediction Platform
echo ==============================================================
echo.
echo [1/2] Launching FastAPI Backend Server (Port 8000)...
start "NetPulse AI - Backend" cmd /k "cd /d %~dp0backend && python -m uvicorn main:app --host 127.0.0.1 --port 8000"

echo Waiting 3 seconds for backend to initialize...
timeout /t 3 /nobreak > nul

echo.
echo [2/2] Launching Vite React Frontend (Port 5173)...
start "NetPulse AI - Frontend" cmd /k "cd /d %~dp0frontend && npm.cmd run dev"

echo.
echo ==============================================================
echo NetPulse AI Servers Successfully Started!
echo.
echo  - Frontend Dashboard: http://localhost:5173/
echo  - Backend API & Docs: http://127.0.0.1:8000/docs
echo ==============================================================
echo (Keep the opened console windows running during showcase)
echo Press any key to exit this launcher window...
pause > nul
