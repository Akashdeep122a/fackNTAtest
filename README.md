# FackNTA - JEE Results Monitor & Tracker

A comprehensive monitoring and tracking system for JEE (Joint Entrance Examination) Main 2026 results. This project consists of two main components that work together to monitor the NTA score-card page and track result updates.

## Table of Contents

- [Features](#features)
- [Project Structure](#project-structure)
- [Requirements](#requirements)
- [Installation](#installation)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Configuration](#configuration)
- [Troubleshooting](#troubleshooting)

## Features

### JEE Results Monitor (`jee_results_monitor.py`)
- **Structural Fingerprinting**: Monitors the NTA score-card login page for structural changes that indicate results are live
- **Multi-Layer Detection**: 
  - HTML skeleton hashing
  - Form action URL monitoring
  - JavaScript & CSS asset tracking
  - New link detection (e.g., "Download Score Card")
  - Page title changes
  - POST probe testing for redirect changes
- **Anti-False-Alarm System**:
  - Confidence scoring (0-100)
  - Multi-layer validation
  - 3-check persistence verification
  - 5-minute cooldown between alerts
- **Sound Notifications**: Audio alerts when results are detected
- **Customizable Intervals**: Adjustable monitoring frequency

### Main Tracker (`Main_tracker.py`)
- **Web Scraping**: Fetches the latest JEE results page
- **Timestamp Tracking**: Monitors "Last Updated" timestamps
- **State Management**: Maintains state across sessions
- **Alarm System**: Visual and audio notifications
- **GUI Interface**: Tkinter-based user interface
- **Multi-threading**: Non-blocking operations

## Project Structure

```
fackNTA/
├── jee_results_monitor.py      # JEE results structural monitor
├── Main_tracker.py             # Main tracker with GUI
├── requirements.txt            # Python dependencies
├── START.sh                    # Linux/Mac startup script
├── START.bat                   # Windows startup script
└── README                      # This file
```

## Requirements

- **Python**: 3.8 or higher
- **Operating System**: Windows, macOS, or Linux
- **Internet Connection**: Required for monitoring NTA website
- **Dependencies**: Listed in `requirements.txt`

### Dependencies

- `beautifulsoup4` - HTML parsing
- `requests` - HTTP requests
- `pygame` - Audio alerts
- `tkinter` - GUI (usually included with Python)
- `lxml` - XML/HTML parsing

## Installation

### Step 1: Clone/Download the Project


If you have Git installed, clone the repository to your desired location:

```bash
git clone https://github.com/DikshitRJ/fackNTA.git
cd fackNTA
```

### Step 2: Setup Python Virtual Environment

Run the following command to create a virtual environment, activate it, and install dependencies:

**Windows:**
```bash
python -m venv .venv && .venv\Scripts\activate && pip install -r requirements.txt
```

**Linux/macOS:**
```bash
python3 -m venv .venv && source .venv/bin/activate && pip install -r requirements.txt
```

### Step 3: Verify Installation

Verify that all packages are installed correctly:

```bash
pip list
```

You should see all packages from `requirements.txt` listed.

## Getting Started

### Quick Start

#### Windows:
Double-click `START.bat` to launch both monitoring scripts.

#### Linux/macOS:
```bash
bash START.sh
```

Or manually:

**Windows:**
```bash
.venv\Scripts\python.exe jee_results_monitor.py
.venv\Scripts\python.exe Main_tracker.py
```

**Linux/macOS:**
```bash
./.venv/bin/python jee_results_monitor.py
./.venv/bin/python Main_tracker.py
```

## Usage

### JEE Results Monitor

The monitor supports several command-line options:

```bash
# Default: 300-second check interval
python jee_results_monitor.py

# Custom interval (check every 15 seconds)
python jee_results_monitor.py --interval 15

# Silent mode (no sound alerts)
python jee_results_monitor.py --no-sound

# One-shot stability test
python jee_results_monitor.py --test
```

### Main Tracker

Simply run the script to start the GUI-based tracker:

```bash
python Main_tracker.py
```

The tracker will:
- Fetch the latest JEE results page
- Monitor for timestamp updates
- Display notifications when changes are detected
- Maintain a state file (`state.json`) with last update information

## Configuration

### Monitor Settings

The JEE Results Monitor uses these detection thresholds:

- **Cumulative Confidence Threshold**: ≥ 60%
- **Minimum Triggers**: ≥ 2 detection layers
- **Check Persistence**: 3 consecutive checks (10s apart)
- **Alert Cooldown**: 5 minutes between alert bursts
- **Default Check Interval**: 30 seconds


## Troubleshooting

### Virtual Environment Issues

**Problem**: `Virtual environment not found` error

**Solution**: Create the virtual environment first:

```bash
# Windows
python -m venv .venv

# Linux/macOS
python3 -m venv .venv
```

### Module Not Found Errors

**Problem**: `ModuleNotFoundError: No module named 'urllib3'` or similar

**Solution**: Ensure the virtual environment is activated and dependencies are installed:

```bash
# Windows
.venv\Scripts\activate
pip install -r requirements.txt

# Linux/macOS
source .venv/bin/activate
pip install -r requirements.txt
```

### Network Errors

**Problem**: Connection timeouts or timeouts when trying to reach NTA website

**Solution**:
- Check your internet connection
- Ensure the NTA website is accessible
- Try increasing the timeout or check interval
- Some ISPs/networks may block the connection; consider using a VPN

### No Sound Alerts

**Problem**: Audio alerts not working

**Solution**:
- Ensure pygame is properly installed: `pip install --upgrade pygame`
- Check your system volume settings
- Try running with sound explicitly enabled (default)
- Use `--no-sound` flag if you prefer silent operation

### GUI Not Displaying (tkinter)

**Problem**: `_tkinter.TclError` or GUI window not appearing

**Solution**:
- Linux/macOS users may need to install tkinter system package:
  ```bash
  # Ubuntu/Debian
  sudo apt-get install python3-tk
  
  # macOS (with Homebrew)
  brew install python-tk
  ```

## Notes

- The monitor is designed to minimize false positives by using multi-layer detection
- Monitoring runs continuously; use Ctrl+C to stop
- Results data is timestamped for reference
- The system respects rate limiting with configurable intervals
- Security: The project includes proper SSL certificate verification



