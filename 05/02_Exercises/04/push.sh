#!/bin/bash
#
# Exercise 04: Tag and push image to Docker Hub, then pull and re-run
SCRIPT_DIR=$(dirname "$0")
CONFIG_FILE="${SCRIPT_DIR}/param.conf"

if [ ! -f "${CONFIG_FILE}" ]; then
  echo "Error: Configuration file ${CONFIG_FILE} not found."
  exit 1
fi
source "${CONFIG_FILE}"

DOCKER_HUB_USER="mendolag"
REPO="m347-mendolag"
TAG="latest"
VOLUME=vol_mendolag

clear
read -p "Docker Hub: [p]ush image, [c]lean local, [r]un from Hub: " action
action=$(echo $action | tr '[A-Z]' '[a-z]')
echo "Your selection: $action"

case $action in
p)
  echo "=== Tagging image ==="
  docker tag ${image} ${DOCKER_HUB_USER}/${REPO}:${TAG}
  docker images
  echo ""
  echo "=== Pushing to Docker Hub ==="
  docker push ${DOCKER_HUB_USER}/${REPO}:${TAG}
  ;;
c)
  echo "=== Stopping and removing container and image ==="
  docker stop ${container}
  docker rm ${container}
  docker rmi ${image}
  docker rmi ${DOCKER_HUB_USER}/${REPO}:${TAG}
  docker ps -a
  docker images
  ;;
r)
  echo "=== Pulling image from Docker Hub ==="
  docker pull ${DOCKER_HUB_USER}/${REPO}:${TAG}
  echo ""
  echo "=== Running pulled image with volume ==="
  docker run -d --name ${container} -p 5000:5000 \
    -v ${VOLUME}:/app ${DOCKER_HUB_USER}/${REPO}:${TAG}
  docker ps -a
  ;;
*)
  echo "Incorrect action entered!"
  exit 1
  ;;
esac
