#!/bin/bash
#
# Exercise 01: Create and test a Docker named volume
CONTAINER=con_mendolag
VOLUME=vol_mendolag

# Create named volume
docker volume create ${VOLUME}

# Start ubuntu container with volume mounted on /var/log (detached, keep alive)
docker run -d --name ${CONTAINER} -v ${VOLUME}:/var/log ubuntu sleep infinity

# List containers and volumes
docker ps -a
docker volume ls
