#!/bin/bash
#
# Setup virtual environment for Exercise 02

# Find Python - try multiple common locations
if command -v python3 &>/dev/null; then
  PY="python3"
elif command -v python &>/dev/null; then
  PY="python"
elif [ -f "/c/Users/giova/AppData/Local/Programs/Python/Launcher/py" ]; then
  PY="/c/Users/giova/AppData/Local/Programs/Python/Launcher/py"
elif [ -f "/c/Program Files/Python313/python.exe" ]; then
  PY="/c/Program Files/Python313/python.exe"
else
  echo "Error: Python not found. Make sure Python is installed and in PATH."
  exit 1
fi

echo "Using Python: ${PY}"

# 1. Show python and pip version
echo "--- Python & pip versions ---"
"${PY}" --version
"${PY}" -m pip --version

# 2. Create virtual environment
echo "--- Creating virtual environment ---"
"${PY}" -m venv venv

# 3. Copy deactivate script if it exists
if [ -f "./deactivate" ]; then
  cp ./deactivate venv/Scripts/deactivate
fi

# 4. Set environment variables
export FLASK_ENV=development
export FLASK_APP=app.py

# 5. Activate virtual environment
echo "--- Activating virtual environment ---"
source venv/Scripts/activate

# 6. Install packages
echo "--- Installing packages ---"
pip install -r requirements.txt

echo ""
echo "Setup complete. Run the app with:"
echo "  flask --app app.py run --host=127.0.0.1 --port=5000"
