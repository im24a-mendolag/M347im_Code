#!/bin/bash
#
# Load configuration
SCRIPT_DIR=$(dirname "$0")
CONFIG_FILE="${SCRIPT_DIR}/param.conf"
# check if configuration exists
if [ ! -f "${CONFIG_FILE}" ]; then
  # print error message and exit script
  echo "Error: Configuration file ${CONFIG_FILE} not found."
  exit 1
fi
# import configuration
source "${CONFIG_FILE}"
# Build a dockerfile with tag -t
docker build -t ${image} -f ${DOCKER_FILE} deploy/
# List images
docker images
# Run the Docker container with auto-restart policy
docker run -d --restart=always --name ${container} -p 3000:3000 ${image}
