@echo off
color 0B
title FreshCart - Quick Launcher

echo.
echo ================================================
echo    FreshCart - Starting Servers
echo ================================================
echo.

cd /d "%~dp0"

REM Start Frontend in new window
echo [1/3] Starting Frontend Server...
start "FreshCart Frontend - Port 5500" cmd /k "color 0A && title FreshCart Frontend && cd /d "%~dp0client" && echo. && echo ================================ && echo   FreshCart Frontend Server && echo   Running on: http://localhost:5500 && echo ================================ && echo. && python -m http.server 5500"

timeout /t 3 /nobreak >nul

REM Start Backend in new window
echo [2/3] Starting Backend Server...
start "FreshCart Backend - Port 5000" cmd /k "color 0E && title FreshCart Backend && cd /d "%~dp0" && echo. && echo ================================ && echo   FreshCart Backend Server && echo   Running on: http://localhost:5000 && echo ================================ && echo. && node server/server.js"

timeout /t 3 /nobreak >nul

REM Open website
echo [3/3] Opening FreshCart in browser...
echo.
timeout /t 2 /nobreak >nul
start http://localhost:5500/pages/index.html

echo.
echo ================================================
echo    FreshCart is Running!
echo ================================================
echo.
echo Website: http://localhost:5500/pages/index.html
echo.
echo Two server windows have opened:
echo   - Green window = Frontend (Port 5500)
echo   - Yellow window = Backend (Port 5000)
echo.
echo Keep those windows open while using FreshCart.
echo Close them to stop the servers.
echo.
echo Your browser should open automatically.
echo If not, visit: http://localhost:5500/pages/index.html
echo.
pause
