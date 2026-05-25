@echo off
setlocal enabledelayedexpansion
title Clevis GUI Launcher

echo ========================================
echo   Compiling and Launching Clevis GUI
echo ========================================
echo.

REM Switch to ProjectCode directory
cd /d "%~dp0ProjectCode"
echo Working directory: %cd%
echo.

REM Check if src exists
if not exist src (
    echo [ERROR] src folder not found!
    pause
    exit /b 1
)

REM Create output directory
if not exist out\production\clevis (
    mkdir out\production\clevis
)

REM Check if javac is available
where javac >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] javac not found!
    pause
    exit /b 1
)

echo [1/2] Compiling Java files...
echo.

REM Collect all .java files
set "filelist="
for /r src %%f in (*.java) do (
    set "filelist=!filelist! "%%f""
)

if "!filelist!"=="" (
    echo [ERROR] No .java files found in src!
    pause
    exit /b 1
)

REM Compile all at once
javac -d out\production\clevis !filelist!

if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Compilation failed!
    pause
    exit /b 1
)

echo.
echo [2/2] Starting GUI...
echo ========================================
echo.

java -cp out\production\clevis hk.edu.polyu.comp.comp2021.clevis.GuiApplication

if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Application exited with error code: %errorlevel%
)

pause