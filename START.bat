@echo off
set "PY=.venv\Scripts\python.exe"

if not exist "%PY%" (
    echo [ERROR] Virtual environment not found.
    echo Please read the README once again
    pause
    exit /b
)

:: Runs both scripts in separate windows simultaneously
start "Results Monitor" "%PY%" jee_results_monitor.py
start "Main Tracker" "%PY%" Main_tracker.py

exit
