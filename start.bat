@echo off
REM OpenStage launcher (Windows) - double-click to run.
REM Keep this window open while presenting; close it to stop.

cd /d "%~dp0"
set PORT=4321
start "" /b python serve.py
timeout /t 1 >nul
start "" "http://localhost:%PORT%/index.html"
echo.
echo OpenStage is running: http://localhost:%PORT%/index.html
echo Open it in Chrome or Edge so files are remembered between sessions.
echo Keep this window open while presenting. Close it to stop.
echo.
pause
