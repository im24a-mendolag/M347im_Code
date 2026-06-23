#!/bin/bash
#
# Teardown: stop and remove container and image from Demo 04
#
CONTAINER_NAME="demo3"
IMAGE_NAME="demo3_img"

# stop and remove container
echo "Stopping container ${CONTAINER_NAME}"
docker stop "${CONTAINER_NAME}"
echo "Removing container ${CONTAINER_NAME}"
docker rm "${CONTAINER_NAME}"

# remove image
echo "Removing image ${IMAGE_NAME}"
docker rmi "${IMAGE_NAME}"

# verify
echo "Remaining containers:"
docker ps -a
echo "Remaining images:"
docker images
