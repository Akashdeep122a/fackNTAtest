#!/bin/bash

PY="./.venv/bin/python"

if [ ! -f "$PY" ]; then
echo "Virtual environment not found."
echo "Create it with: python3 -m venv .venv"
exit 1
fi

"$PY" jee_results_monitor.py &
"$PY" Main_tracker.py &
