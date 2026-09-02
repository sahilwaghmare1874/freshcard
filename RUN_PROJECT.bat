@echo off
REM ============================================
REM FreshCart - Complete Project Launcher
REM ============================================

echo.
echo ========================================
echo   FreshCart - Complete Project Launcher
echo ========================================
echo.

REM Check if .env exists, if not create it
if not exist .env (
    echo Creating .env file...
    copy .env.development .env
    echo.
    echo IMPORTANT: Please edit .env and set your MySQL password!
    echo Look for: DB_PASSWORD=
    echo.
    pause
)

REM Check if node_modules exists
if not exist node_modules (
    echo Installing npm dependencies...
    echo This may take a few minutes...
    echo.
    call npm install
    if %ERRORLEVEL% NEQ 0 (
        echo ERROR: Failed to install dependencies
        pause
        exit /b 1
    )
    echo.
    echo Dependencies installed successfully!
    echo.
)

echo ========================================
echo   Starting Frontend Server (Port 5500)
echo ========================================
echo.
start "FreshCart Frontend" cmd /k "cd client && python -m http.server 5500"
timeout /t 2 /nobreak >nul

echo ========================================
echo   Starting Backend Server (Port 5000)
echo ========================================
echo.
start "FreshCart Backend" cmd /k "npm start"
timeout /t 2 /nobreak >nul

echo.
echo ========================================
echo   FreshCart is Starting!
echo ========================================
echo.
echo Frontend: http://localhost:5500/pages/index.html
echo Backend:  http://localhost:5000
echo Test:     http://localhost:5500/test-connectivity.html
echo.
echo Two new windows have opened:
echo   1. Frontend Server (Python)
echo   2. Backend Server (Node.js)
echo.
echo Close those windows to stop the servers.
echo.
echo Press any key to open FreshCart in your browser...
pause >nul

start http://localhost:5500/pages/index.html

echo.
echo FreshCart is running!
echo.
pause
