#!/bin/bash
#
# Exercise 03: Setup Python venv and run appointments app locally
SCRIPT_DIR=$(dirname "$0")

# Detect OS to set correct python command and venv activate path
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
  PY="python"
  ACTIVATE="venv/Scripts/activate"
else
  PY="python3"
  ACTIVATE="venv/bin/activate"
fi

if ! command -v ${PY} &>/dev/null; then
  echo "Error: Python not found. Make sure Python is installed and in PATH."
  exit 1
fi

echo "Using Python: ${PY} (OS: ${OSTYPE})"

# 1. Show python and pip version
echo "--- Python & pip versions ---"
${PY} --version
${PY} -m pip --version

# 2. Setup virtual environment
echo "--- Creating virtual environment ---"
cd "${SCRIPT_DIR}"
${PY} -m venv venv

# 3. Copy deactivate script if it exists
if [ -f "./deactivate" ]; then
  cp ./deactivate venv/Scripts/deactivate
fi

# 4. Set environment variables
export FLASK_ENV=development
export FLASK_APP=app.py

# 5. Activate the virtual environment
echo "--- Activating virtual environment ---"
source ${ACTIVATE}

# 6. Install packages
echo "--- Installing packages ---"
pip install -r requirements.txt

echo ""
echo "Setup complete. Run the app with:"
echo "  flask --app app.py run --host=127.0.0.1 --port=4000"
