@echo off
color 0B
title FreshCart - Alternative Launcher

echo.
echo ================================================
echo    FreshCart - Starting with npx http-server
echo ================================================
echo.

cd /d "%~dp0"

REM Start Frontend using npx http-server (no Python needed!)
echo Starting Frontend Server...
echo This will open in a new window...
echo.

start "FreshCart - Running on Port 8080" cmd /k "color 0A && title FreshCart Frontend && cd /d "%~dp0client" && echo. && echo ================================ && echo   FreshCart is Running! && echo   Open: http://localhost:8080/pages/ && echo ================================ && echo. && npx -y http-server -p 8080 -o /pages/index.html"

echo.
echo ================================================
echo    Opening FreshCart...
echo ================================================
echo.
echo Server starting on: http://localhost:8080
echo.
echo A new window will open with the server.
echo Your browser will open automatically.
echo.
echo If browser doesn't open, visit:
echo http://localhost:8080/pages/index.html
echo.
pause
