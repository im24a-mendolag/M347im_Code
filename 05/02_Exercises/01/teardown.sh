#!/bin/bash
#
# Exercise 01: Stop and remove all created resources
CONTAINER=con_mendolag
VOLUME=vol_mendolag

# Stop and remove container
docker stop ${CONTAINER}
docker rm ${CONTAINER}

# Remove named volume
docker volume rm ${VOLUME}

# Verify everything is removed
echo "=== Remaining containers ==="
docker ps -a

echo ""
echo "=== Remaining volumes ==="
docker volume ls
