@echo off

set PY=.venv\Scripts\python.exe

if not exist "%PY%" (
    echo Virtual environment not found.
    echo Please create it first: python -m venv .venv
    pause
    exit /b
)

start "" "%PY%" jee_results_monitor.py
start "" "%PY%" Main_tracker.py

exit
