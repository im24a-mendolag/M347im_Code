#!/bin/bash
#
# Exercise 02: Test bind mount between host and container
CONTAINER=con_mendolag
DATA_DIR="${HOME}/data"

# Task 3: Test if container and bind mount were created
echo "=== Containers ==="
docker ps -a

echo ""
echo "=== Bind mount info ==="
docker inspect ${CONTAINER} --format '{{ range .Mounts }}Source: {{ .Source }} -> Destination: {{ .Destination }}{{ end }}'

# Task 4: Create an empty file in container's /tmp
echo ""
echo "=== Creating file in container /tmp ==="
docker exec ${CONTAINER} touch /tmp/file_from_container.txt
docker exec ${CONTAINER} ls /tmp

# Task 5: Verify file appears in HOST's data directory
echo ""
echo "=== Checking HOST data directory ==="
ls "${DATA_DIR}"

# Task 6: Create an empty file in HOST's data directory
echo ""
echo "=== Creating file on HOST in ${DATA_DIR} ==="
touch "${DATA_DIR}/file_from_host.txt"
ls "${DATA_DIR}"

# Task 7: Verify file appears in container's /tmp
echo ""
echo "=== Checking container /tmp ==="
docker exec ${CONTAINER} ls /tmp
