#!/bin/bash
#
# Exercise 02: Delete all created resources
CONTAINER=con_mendolag
DATA_DIR="${HOME}/data"

# Stop and remove container
docker stop ${CONTAINER}
docker rm ${CONTAINER}

# Remove host data directory
rm -rf "${DATA_DIR}"
echo "Removed ${DATA_DIR}"

# Verify
echo ""
echo "=== Remaining containers ==="
docker ps -a

echo ""
echo "=== data directory check ==="
if [ -d "${DATA_DIR}" ]; then
  echo "WARNING: ${DATA_DIR} still exists"
else
  echo "OK: ${DATA_DIR} has been removed"
fi
