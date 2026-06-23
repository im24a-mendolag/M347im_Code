#!/bin/bash
#
# Exercise 01: Test container and volume
CONTAINER=con_mendolag
VOLUME=vol_mendolag

# Task 2: Test if container and volume were created
echo "=== Containers ==="
docker ps -a

echo ""
echo "=== Volumes ==="
docker volume ls

# Task 3: Check log files inside the container
echo ""
echo "=== Log files in /var/log ==="
docker exec ${CONTAINER} ls /var/log

# Task 4: Output the volume mount point
echo ""
echo "=== Volume mount point ==="
docker volume inspect ${VOLUME} --format '{{ .Mountpoint }}'
