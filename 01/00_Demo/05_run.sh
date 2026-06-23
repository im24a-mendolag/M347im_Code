#!/bin/bash
#
# set docker file name
DOCKERFILE="Dockerfile2"
# set image name
IMAGE_NAME="demo3_img"
# set container name
CONTAINER_NAME="demo3"

# if docker file does not exist ..
if [ ! -f "${DOCKERFILE}" ]; then
  # print error message and exit script
  echo "Error: ${DOCKERFILE} does not exist"
  exit 1
fi
# 1. Build a dockerfile with tag -t
echo "Building image ${IMAGE_NAME} from ${DOCKERFILE}"
docker build -t "${IMAGE_NAME}" -f "${DOCKERFILE}" .
# 2. List images
echo "List images:"
docker images
# 3. Run image with and name it m347_c2
docker run -itd --name "${CONTAINER_NAME}" "${IMAGE_NAME}"
# 4. Start bash-shell in container
docker exec -it "${CONTAINER_NAME}" bash
