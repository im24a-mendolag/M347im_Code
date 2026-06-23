#!/bin/bash
#
# Exercise 02: Create and test a Docker bind mount
CONTAINER=con_mendolag
DATA_DIR="${HOME}/data"

# Task 1: Navigate to HOME and create data directory
cd "${HOME}"
mkdir -p data
echo "Created data directory: ${DATA_DIR}"

# Task 2: Start ubuntu container with bind mount HOME/data -> /tmp in container
docker run -d --name ${CONTAINER} -v "${DATA_DIR}:/tmp" ubuntu sleep infinity

# List containers
docker ps -a
