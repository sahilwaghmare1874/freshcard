@echo off
color 0B
title FreshCart - Simple Launcher

echo.
echo ========================================
echo    FreshCart - Quick Start
echo ========================================
echo.

cd /d "%~dp0"

REM Create .env if needed
if not exist .env copy /Y .env.development .env >nul 2>&1

echo Starting servers...
echo.

REM Start Frontend
echo [1] Starting Frontend Server (Port 5500)...
start "FreshCart Frontend" cmd /k "cd /d "%~dp0client" && color 0A && title FreshCart Frontend && echo. && echo ================================ && echo   FreshCart Frontend Server && echo   Port: 5500 && echo ================================ && echo. && python -m http.server 5500"

timeout /t 2 /nobreak >nul

REM Start Backend
echo [2] Starting Backend Server (Port 5000)...
start "FreshCart Backend" cmd /k "cd /d "%~dp0" && color 0E && title FreshCart Backend && echo. && echo ================================ && echo   FreshCart Backend Server && echo   Port: 5000 && echo ================================ && echo. && if not exist node_modules (echo Installing dependencies... && npm install && echo.) && npm start"

timeout /t 3 /nobreak >nul

echo.
echo ========================================
echo    Servers Started!
echo ========================================
echo.
echo Frontend: http://localhost:5500/pages/index.html
echo Backend:  http://localhost:5000
echo.
echo Opening FreshCart in browser...
timeout /t 3 /nobreak >nul
start http://localhost:5500/pages/index.html

echo.
echo FreshCart is running!
echo Keep the server windows open.
echo.
pause
