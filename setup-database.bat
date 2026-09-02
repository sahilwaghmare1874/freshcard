@echo off
REM ============================================
REM FreshCart - Database Setup Script
REM ============================================

echo.
echo ========================================
echo   FreshCart Database Setup
echo ========================================
echo.

REM Check if MySQL is accessible
where mysql >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: MySQL is not installed or not in PATH
    echo Please install MySQL and add it to your PATH
    pause
    exit /b 1
)

echo Step 1: Creating database and schema...
mysql -u root -p < database\schema.sql

if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Failed to create database schema
    pause
    exit /b 1
)

echo Step 2: Seeding database with sample data...
mysql -u root -p < database\seed.sql

if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Failed to seed database
    pause
    exit /b 1
)

echo.
echo ========================================
echo   Database setup completed successfully!
echo ========================================
echo.
pause
