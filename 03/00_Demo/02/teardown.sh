#!/bin/bash
# 5. Stoppen Sie den laufenden Container
# 6. Löschen anschliessend das Image und überprüfen Sie die Löschung
# set variables for teardown
SCRIPT_DIR=$(dirname "$0")
CONFIG_FILE="${SCRIPT_DIR}/param.conf"
TD_BASE="${SCRIPT_DIR}/../bin/td-base.sh"

# loop through item and check if exists
for item in "${CONFIG_FILE}" \
            "${TD_BASE}"; do
  if [ ! -f "${item}" ]; then
    # print error message and exit script
    echo "Error: Required file ${item} not found."
    exit 1
  fi
done

# Import configurations and code
source "${CONFIG_FILE}"
source "${TD_BASE}" 1
