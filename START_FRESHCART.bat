@echo off
SETLOCAL EnableDelayedExpansion

REM ============================================
REM FreshCart - Automated Complete Setup
REM ============================================

color 0A
title FreshCart - Automated Setup

echo.
echo ================================================
echo    FreshCart E-Commerce Platform
echo    Automated Setup and Launch
echo ================================================
echo.

cd /d "%~dp0"

REM Step 1: Create .env file
echo [1/5] Creating environment configuration...
if not exist .env (
    copy /Y .env.development .env >nul 2>&1
    echo       Created .env file
) else (
    echo       .env file already exists
)
echo.

REM Step 2: Install npm dependencies
echo [2/5] Installing Node.js dependencies...
echo       This may take 2-3 minutes on first run...
if not exist node_modules (
    call npm install >nul 2>&1
    if !ERRORLEVEL! EQU 0 (
        echo       Dependencies installed successfully!
    ) else (
        echo       WARNING: npm install may have encountered issues
        echo       Continuing anyway...
    )
) else (
    echo       Dependencies already installed
)
echo.

REM Step 3: Check database (optional)
echo [3/5] Database setup (optional)...
echo       Note: Database setup requires MySQL
echo       You can skip this and use the app without backend
echo.

REM Step 4: Start Frontend Server
echo [4/5] Starting Frontend Server...
start "FreshCart Frontend (Port 5500)" cmd /k "cd /d "%~dp0client" && echo Starting Frontend Server... && python -m http.server 5500"
timeout /t 2 /nobreak >nul
echo       Frontend server started on port 5500
echo.

REM Step 5: Start Backend Server
echo [5/5] Starting Backend Server...
start "FreshCart Backend (Port 5000)" cmd /k "cd /d "%~dp0" && echo Starting Backend Server... && npm start"
timeout /t 3 /nobreak >nul
echo       Backend server started on port 5000
echo.

echo ================================================
echo    FreshCart is Now Running!
echo ================================================
echo.
echo Frontend: http://localhost:5500/pages/index.html
echo Backend:  http://localhost:5000
echo Test API: http://localhost:5500/test-connectivity.html
echo.
echo Two server windows have opened:
echo   - Frontend Server (Python - Port 5500)
echo   - Backend Server (Node.js - Port 5000)
echo.
echo IMPORTANT:
echo   - Keep both server windows open
echo   - Close them to stop the servers
echo   - If backend shows database errors, that's OK
echo     (you can still view the frontend)
echo.
echo Opening FreshCart in your default browser...
timeout /t 2 /nobreak >nul
start http://localhost:5500/pages/index.html

echo.
echo ================================================
echo Setup complete! Enjoy FreshCart!
echo ================================================
echo.
echo Press any key to close this window...
pause >nul
