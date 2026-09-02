@echo off
title FreshCart - Direct Open

echo.
echo ================================================
echo    Opening FreshCart Directly
echo ================================================
echo.

cd /d "%~dp0"

echo Opening FreshCart in your default browser...
echo.

REM Open the HTML file directly
start "" "file:///%~dp0client\pages\index.html"

echo.
echo FreshCart opened!
echo.
echo Note: Some features may not work without a server.
echo For full functionality, use RUN_WEBSITE.bat instead.
echo.
pause
